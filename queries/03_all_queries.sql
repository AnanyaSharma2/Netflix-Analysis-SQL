use netflix;

-- 1. list all movies with title, release year and duration sorted by newest first
select title ,release_year , duration
from movies
order by release_year desc ;

-- 2. count total users per country
select country , count(*) as total_users
from users 
group by country
order by count(*) desc;

-- 3. find all users who signed up in 2024
select user_id, name, country, signup_date
from users
where year(signup_date) = 2024
order by signup_date;

-- 4. find movies with imdb rating greater than 8.5
select title , imdb_rating ,release_year 
from movies 
where imdb_rating >8.5
order by imdb_rating desc ;

-- 5. find all users who signed up in the last 30 days
select name, country ,signup_date
from users 
where signup_date > date_sub(current_date(),interval 30 day)
order by signup_date desc;

-- 6. count users per gender and calculate percentage share
select gender,
       count(*) as total,
       round(count(*) * 100.0 / sum(count(*)) over(), 1) as pct
from users
group by gender;

-- 7. list all distinct countries where users are from
select distinct country
from users
order by country;

-- 8. find all hindi language movies sorted by rating
select title, release_year, imdb_rating
from movies
where language = 'hindi'
order by imdb_rating desc;

-- 9. find all movies longer than 2.5 hours
select title, release_year, imdb_rating ,duration
from movies
where duration >150 
order by duration desc;

-- 10. convert movie duration into hour-minute format
select title, duration,
concat(floor(duration/60), 'h ', duration mod 60, 'm') as formatted_duration
from movies
where duration > 150
order by duration desc;

-- 11. show all subscription plans with features in yes/no format
select plan_name, price_monthly,max_screens ,
case when has_4k = 0 then "no" else "yes" end as has_4k,
case when has_downloads = 0 then "no" else "yes" end as has_downloads
from subscription_plans ;

-- 12. list all movies with their genres
select m.title , 
group_concat(g.genre_name order by g.genre_name separator ', ') as genre
from movies m
inner join movie_genres mg on m.movie_id = mg.movie_id
inner join genres g on mg.genre_id = g.genre_id 
group by m.title; 

-- 13. show each movie with its director
select m.title, d.director_name, m.release_year
from movies m
join movie_directors md on m.movie_id = md.movie_id
join directors d on md.director_id = d.director_id
order by d.director_name, m.release_year;

-- 14. find all movies directed by christopher nolan
select m.title, m.release_year, m.imdb_rating
from movies m
join movie_directors md on m.movie_id = md.movie_id
join directors d on md.director_id = d.director_id
where d.director_name = "christopher nolan"
order by m.release_year;

-- 15. calculate total watch time per user including users with no watch history
select u.name, u.country,
coalesce(sum(wh.watch_duration), 0) as total_watch_mins
from users u
left join watch_history wh on u.user_id = wh.user_id
group by u.user_id, u.name, u.country
order by total_watch_mins desc;

-- 16. list users with their current active subscription plan
select u.name, u.country, u.user_segment,
sp.plan_name, sp.price_monthly
from users u
join user_subscriptions us on u.user_id = us.user_id
join subscription_plans sp on us.plan_id = sp.plan_id
where us.end_date is null
order by sp.price_monthly desc;

-- 17. show movies watched by users from india
select distinct m.title, m.language, m.imdb_rating 
from movies m
inner join watch_history wh on m.movie_id - wh.movie_id
inner join users u on wh.user_id = u.user_id
where u.country = "india"
order by m.title;

-- 18. count number of actors per movie including movies with no actors
select m.title,
count(ma.actor_id) as actor_count
from movies m
left join movie_actors ma on m.movie_id = ma.movie_id
group by m.movie_id, m.title
order by actor_count desc;

-- 19. find actors who appeared in more than 2 movies with movie names
select a.actor_name,
count(ma.movie_id) as movie_count,
group_concat(m.title order by m.release_year separator ', ') as movies
from actors a
join movie_actors ma on a.actor_id = ma.actor_id
join movies m on ma.movie_id = m.movie_id
group by a.actor_id, a.actor_name
having count(ma.movie_id) > 2
order by movie_count desc;

-- 20. analyze genre-level engagement metrics
select g.genre_name,
round(avg(wh.watch_duration), 1) as avg_watch_mins,
round(avg(wh.completion_pct), 1) as avg_completion_pct,
count(distinct wh.user_id) as unique_viewers
from genres g
join movie_genres mg on g.genre_id = mg.genre_id
join movies m on mg.movie_id = m.movie_id
join watch_history wh on m.movie_id = wh.movie_id
group by g.genre_name
order by avg_completion_pct desc;

-- 21. find movies that have never been watched
select m.title, m.release_year, m.language, m.imdb_rating
from movies m
where m.movie_id not in (
select distinct movie_id from watch_history
)
order by m.imdb_rating desc;

-- 22. find users whose total watch time is above platform average
select u.name, u.country, u.user_segment,
sum(wh.watch_duration) as total_watch_mins
from users u
join watch_history wh on u.user_id = wh.user_id
group by u.user_id, u.name, u.country, u.user_segment
having sum(wh.watch_duration) > (
select avg(total) from (
select sum(watch_duration) as total
from watch_history
group by user_id
) t
)
order by total_watch_mins desc;

-- 23. top 5 most watched movies with engagement metrics
select m.title,
count(wh.watch_id) as total_views ,
count(distinct wh.user_id) as unique_viewers,
round(avg(wh.completion_pct),2) as avg_completion_pct
from movies m
inner join watch_history wh on m.movie_id = wh.movie_id
group by m.title
order by count(wh.watch_id) desc
limit 5;

-- 24. preview churned users with cancellation reason
select * from user_subscriptions 
where cancellation_reason is not null 
limit 5;

-- 25. breakdown of cancellation reasons with percentage
select cancellation_reason,
count(*) as churned_count,
round(count(*) * 100.0 / sum(count(*)) over(), 1) as pct
from user_subscriptions
where end_date is not null
and cancellation_reason is not null
group by cancellation_reason
order by churned_count desc;

-- 26. find movies with high ratings and enough reviews
select m.title,
round(avg(ur.rating), 2) as avg_rating,
count(ur.rating_id) as rating_count
from movies m
join user_ratings ur on m.movie_id = ur.movie_id
group by m.movie_id, m.title
having avg(ur.rating) > 6.5
and count(ur.rating_id) >= 100
order by avg_rating desc;

-- 27. device usage breakdown overall
select device_type, count(*) 
from watch_history 
group by device_type 
order by count(*) desc;

-- 28. device usage per country with percentage
select u.country,
wh.device_type,
count(*) as sessions,
round(count(*) * 100.0 / sum(count(*)) over(partition by u.country), 1) as pct_in_country
from users u
join watch_history wh on u.user_id = wh.user_id
group by u.country, wh.device_type
order by u.country, sessions desc;

-- 29. rank movies by imdb rating using different ranking methods
select title, imdb_rating,
row_number() over (order by imdb_rating desc) as row_num,
rank() over (order by imdb_rating desc) as rnk,
dense_rank() over (order by imdb_rating desc) as dense_rnk
from movies;

-- 30. top 3 movies per genre by average user rating using subquery
select * from (
    select g.genre_name,
           m.title,
           round(avg(ur.rating),2) as avg_rating,
           dense_rank() over(partition by g.genre_name order by avg(ur.rating) desc) as rnk
    from genres g
    join movie_genres mg on g.genre_id = mg.genre_id
    join movies m on mg.movie_id = m.movie_id
    join user_ratings ur on m.movie_id = ur.movie_id
    group by g.genre_name, m.movie_id, m.title
) t
where rnk <= 3;

-- 31. top 3 movies per genre using cte (same logic as above but cleaner)
with ranked_movies as (
    select 
        g.genre_name,
        m.title,
        round(avg(ur.rating), 2) as avg_rating,
        dense_rank() over (
            partition by g.genre_name 
            order by avg(ur.rating) desc
        ) as rnk
    from genres g
    join movie_genres mg on g.genre_id = mg.genre_id
    join movies m on mg.movie_id = m.movie_id
    join user_ratings ur on m.movie_id = ur.movie_id
    group by g.genre_name, m.movie_id, m.title
)
select *
from ranked_movies
where rnk <= 3;

-- 32. running total of watch duration per user over time
select user_id,
       date(watch_time) as watch_date,
       watch_duration,
       sum(watch_duration) over (
           partition by user_id
           order by watch_time
           rows between unbounded preceding and current row
       ) as running_total_mins
from watch_history
order by user_id, watch_time;

-- 33. calculate lag/lead to find days between consecutive watches
select user_id,
       date(watch_time) as watch_date,
       lag(date(watch_time)) over (partition by user_id order by watch_time) as prev_watch,
       lead(date(watch_time)) over (partition by user_id order by watch_time) as next_watch,
       datediff(
           date(watch_time),
           lag(date(watch_time)) over (partition by user_id order by watch_time)
       ) as days_since_last_watch
from watch_history
order by user_id, watch_time;

-- 34. same lag/lead query filtered for a single user (user_id = 1)
select * from (
    select user_id,
           date(watch_time) as watch_date,
           lag(date(watch_time)) over (partition by user_id order by watch_time) as prev_watch,
           lead(date(watch_time)) over (partition by user_id order by watch_time) as next_watch,
           datediff(
               date(watch_time),
               lag(date(watch_time)) over (partition by user_id order by watch_time)
           ) as days_since_last_watch
    from watch_history
    order by user_id, watch_time
) t
where user_id = 1;

-- 35. calculate 7-day rolling active users (dau aggregation)
with daily_active as (
    select date(watch_time) as watch_date,
           count(distinct user_id) as dau
    from watch_history
    group by date(watch_time)
)
select watch_date, dau,
       sum(dau) over (
           order by watch_date
           range between interval 6 day preceding and current row
       ) as rolling_7day_users
from daily_active
order by watch_date;

-- 36. classify users into 4 engagement quartiles using ntile
with user_watches as (
    select user_id, count(*) as total_watches
    from watch_history
    group by user_id
)
select u.user_id, u.name, u.user_segment,
       uw.total_watches,
       ntile(4) over (order by uw.total_watches desc) as engagement_quartile,
       case ntile(4) over (order by uw.total_watches desc)
           when 1 then 'power'
           when 2 then 'high'
           when 3 then 'medium'
           else 'low'
       end as engagement_label
from users u
join user_watches uw on u.user_id = uw.user_id
order by engagement_quartile, total_watches desc;

-- 37. monthly signup trend with month-over-month growth (cte approach)
with monthly_signups as (
    select date_format(signup_date, '%y-%m') as month,
           count(*) as new_users
    from users
    group by date_format(signup_date, '%y-%m')
)
select month, new_users,
       lag(new_users) over (order by month) as prev_month,
       round(
           (new_users - lag(new_users) over (order by month))
           * 100.0 / nullif(lag(new_users) over (order by month), 0),
       1) as mom_growth_pct
from monthly_signups
order by month;

-- 38. monthly signup trend with mom growth (direct aggregation approach)
select 
    date_format(signup_date, '%y-%m') as month,
    count(*) as new_users,
    lag(count(*)) over (order by date_format(signup_date, '%y-%m')) as prev_month,
    round(
        (count(*) - lag(count(*)) over (order by date_format(signup_date, '%y-%m')))
        * 100.0 / nullif(lag(count(*)) over (order by date_format(signup_date, '%y-%m')), 0),
    1) as mom_growth_pct
from users
group by date_format(signup_date, '%y-%m')
order by month;

-- 39. churn classification using last watch date (cte)
with last_watch as (
    select user_id, max(watch_time) as last_watch_time
    from watch_history
    group by user_id
)
select u.user_id, u.name, u.country, u.user_segment,
       date(lw.last_watch_time) as last_seen,
       datediff(curdate(), lw.last_watch_time) as days_inactive,
       case
           when lw.last_watch_time is null then 'never_watched'
           when datediff(curdate(), lw.last_watch_time) <= 7 then 'active'
           when datediff(curdate(), lw.last_watch_time) between 8 and 30 then 'at_risk'
           else 'churned'
       end as churn_status
from users u
left join last_watch lw on u.user_id = lw.user_id
order by days_inactive desc;

-- 40. churn classification directly from watch_history table
select 
    user_id,
    min(date(watch_time)) as first_day,
    max(date(watch_time)) as last_seen,
    datediff(max(watch_time), min(watch_time)) as total_days_watch,
    datediff(curdate(), max(watch_time)) as inactive_days,
    case
        when max(watch_time) is null then 'never_watched'
        when datediff(curdate(), max(watch_time)) <= 7 then 'active'
        when datediff(curdate(), max(watch_time)) between 8 and 30 then 'at_risk'
        else 'churned'
    end as churn_status
from watch_history
group by user_id;

-- 41. repeat churn classification using cte (same logic)
with last_watch as (
    select user_id, max(watch_time) as last_watch_time
    from watch_history
    group by user_id
)
select u.user_id, u.name, u.country, u.user_segment,
       date(lw.last_watch_time) as last_seen,
       datediff(curdate(), lw.last_watch_time) as days_inactive,
       case
           when lw.last_watch_time is null then 'never_watched'
           when datediff(curdate(), lw.last_watch_time) <= 7 then 'active'
           when datediff(curdate(), lw.last_watch_time) between 8 and 30 then 'at_risk'
           else 'churned'
       end as churn_status
from users u
left join last_watch lw on u.user_id = lw.user_id
order by days_inactive desc;

-- 42. monthly cohort retention analysis
with first_watch as (
    select user_id,
           date_format(min(watch_time), '%y-%m') as cohort_month
    from watch_history
    group by user_id
),
monthly_activity as (
    select distinct user_id,
           date_format(watch_time, '%y-%m') as active_month
    from watch_history
)
select fw.cohort_month,
       ma.active_month,
       count(distinct ma.user_id) as retained_users,
       count(distinct fw2.user_id) as cohort_size,
       round(count(distinct ma.user_id) * 100.0
             / nullif(count(distinct fw2.user_id), 0), 1) as retention_pct
from first_watch fw
join first_watch fw2 on fw.cohort_month = fw2.cohort_month
join monthly_activity ma on fw.user_id = ma.user_id
group by fw.cohort_month, ma.active_month
order by fw.cohort_month, ma.active_month;

-- 43. calculate user lifetime value (ltv) score
with user_stats as (
    select wh.user_id,
           sum(wh.watch_duration) as total_watch_mins,
           avg(ur.rating) as avg_rating_given
    from watch_history wh
    left join user_ratings ur on wh.user_id = ur.user_id
    group by wh.user_id
)
select u.name, u.country, u.user_segment,
       sp.plan_name, sp.price_monthly,
       us.total_watch_mins,
       round(us.avg_rating_given, 1) as avg_rating,
       round(us.total_watch_mins * coalesce(us.avg_rating_given, 7), 0) as ltv_score,
       ntile(4) over (
           order by us.total_watch_mins * coalesce(us.avg_rating_given, 7) desc
       ) as ltv_quartile
from user_stats us
join users u on us.user_id = u.user_id
join user_subscriptions s on u.user_id = s.user_id and s.end_date is null
join subscription_plans sp on s.plan_id = sp.plan_id
order by ltv_score desc;

-- 44. categorize user watch behavior into completion stages
select
    case
        when completion_pct < 10  then '1. 0-10%   immediate drop'
        when completion_pct < 25  then '2. 10-25%  early drop'
        when completion_pct < 50  then '3. 25-50%  mid drop'
        when completion_pct < 75  then '4. 50-75%  late drop'
        when completion_pct < 90  then '5. 75-90%  near complete'
        else                           '6. 90-100% completed'
    end as watch_stage,
    count(*) as sessions,
    round(count(*) * 100.0 / sum(count(*)) over(), 1) as pct_of_total
from watch_history
group by watch_stage
order by watch_stage;

-- 45. identify binge watching sessions (3 or more sessions per day per user)
with binge_sessions as (
    select user_id,
           date(watch_time) as watch_date,
           count(*) as sessions,
           sum(watch_duration) as total_mins
    from watch_history
    group by user_id, date(watch_time)
    having count(*) >= 3
)
select u.name, u.country, u.user_segment,
       bs.watch_date,
       bs.sessions,
       bs.total_mins
from binge_sessions bs
join users u on bs.user_id = u.user_id
order by bs.sessions desc, bs.total_mins desc;

-- 46. revenue analysis by subscription plan (mrr, churn rate, active vs churned)
select sp.plan_name,
       sp.price_monthly,
       count(us.sub_id) as total_subs,
       sum(case when us.end_date is null then 1 else 0 end) as active_subs,
       sum(case when us.end_date is not null then 1 else 0 end) as churned_subs,
       round(sum(case when us.end_date is not null then 1 else 0 end)
             * 100.0 / count(us.sub_id), 1) as churn_rate_pct,
       sum(case when us.end_date is null then sp.price_monthly else 0 end) as mrr
from subscription_plans sp
left join user_subscriptions us on sp.plan_id = us.plan_id
group by sp.plan_id, sp.plan_name, sp.price_monthly
order by sp.price_monthly;

-- 47. conversion funnel analysis (signup → subscription → engagement → active)
with funnel as (
    select
        count(distinct u.user_id) as total_signups,
        count(distinct us.user_id) as subscribed,
        count(distinct wh.user_id) as watched_once,
        count(distinct case when wc.watches >= 5 then wc.user_id end) as watched_5_plus,
        count(distinct case when us2.end_date is null then us2.user_id end) as still_active
    from users u
    left join user_subscriptions us  on u.user_id = us.user_id
    left join watch_history wh on u.user_id = wh.user_id
    left join (
        select user_id, count(*) as watches
        from watch_history
        group by user_id
    ) wc on u.user_id = wc.user_id
    left join user_subscriptions us2 on u.user_id = us2.user_id
)
select 'signed up' as stage, total_signups as users, 100.0 as pct from funnel
union all 
select 'subscribed', subscribed, round(subscribed*100.0/total_signups,1) from funnel
union all 
select 'watched (1+)', watched_once, round(watched_once*100.0/total_signups,1) from funnel
union all 
select 'watched (5+)', watched_5_plus, round(watched_5_plus*100.0/total_signups,1) from funnel
union all 
select 'active today', still_active, round(still_active*100.0/total_signups,1) from funnel;

-- 48. recommendation system: find movies frequently co-watched with a given movie
select b.movie_id as recommended_movie_id,
       m.title as recommended_title,
       count(distinct b.user_id) as co_watch_count
from watch_history a
join watch_history b on a.user_id = b.user_id
                    and a.movie_id != b.movie_id
join movies m on b.movie_id = m.movie_id
where a.movie_id = 1   -- seed movie
group by b.movie_id, m.title
order by co_watch_count desc
limit 10;

-- 49. identify high-value users who are at risk of churn
with user_profile as (
    select user_id,
           sum(watch_duration) as total_watch_mins,
           max(watch_time) as last_watch_time,
           count(*) as total_watches,
           ntile(4) over (order by sum(watch_duration) desc) as watch_quartile
    from watch_history
    group by user_id
)
select u.name, u.country, u.user_segment,
       up.total_watch_mins,
       up.total_watches,
       date(up.last_watch_time) as last_seen,
       datediff(curdate(), up.last_watch_time) as days_inactive,
       'high value - at risk' as alert_tag
from user_profile up
join users u on up.user_id = u.user_id
where up.watch_quartile = 1
  and datediff(curdate(), up.last_watch_time) >= 14
order by up.total_watch_mins desc;

-- 50. analyze user lifetime value (ltv) by referral source
with user_ltv as (
    select wh.user_id,
           sum(wh.watch_duration) as total_mins,
           avg(ur.rating) as avg_rating
    from watch_history wh
    left join user_ratings ur on wh.user_id = ur.user_id
    group by wh.user_id
)
select u.referral_source,
       count(distinct u.user_id) as total_users,
       round(avg(ltv.total_mins), 0) as avg_watch_mins,
       round(avg(ltv.total_mins * coalesce(ltv.avg_rating,7)), 0) as avg_ltv_score,
       round(avg(sp.price_monthly), 2) as avg_plan_price,
       round(sum(case when us.end_date is null then 1 else 0 end)
             * 100.0 / count(distinct u.user_id), 1) as retention_rate_pct
from users u
join user_ltv ltv on u.user_id = ltv.user_id
join user_subscriptions us on u.user_id = us.user_id
join subscription_plans sp on us.plan_id = sp.plan_id
group by u.referral_source
order by avg_ltv_score desc;

-- 51. generate date series and track daily activity including inactive days
with recursive date_series as (
    select date('2024-01-01') as dt
    union all
    select date_add(dt, interval 1 day)
    from date_series
    where dt < date('2024-03-31')
),
daily_activity as (
    select date(watch_time) as watch_date,
           count(*) as sessions
    from watch_history
    where watch_time between '2024-01-01' and '2024-03-31'
    group by date(watch_time)
)
select ds.dt,
       coalesce(da.sessions, 0) as sessions,
       case when da.sessions is null then 'no activity' else 'active' end as status
from date_series ds
left join daily_activity da on ds.dt = da.watch_date
order by ds.dt;

-- 52. overall platform metrics dashboard (kpis)
select
    (select count(*) from users) as total_users,
    (select count(*) from users where user_segment = 'power') as power_users,
    (select count(*) from watch_history) as total_sessions,
    (select round(avg(watch_duration),1) from watch_history) as avg_session_mins,
    (select round(avg(completion_pct),1) from watch_history) as avg_completion_pct,
    (select count(*) from user_subscriptions where end_date is null) as active_subscribers,
    (select count(*) from user_subscriptions where end_date is not null) as total_churned,
    (select round(sum(sp.price_monthly), 2)
     from user_subscriptions us
     join subscription_plans sp on us.plan_id = sp.plan_id
     where us.end_date is null) as current_mrr,
    (select count(distinct user_id)
     from watch_history
     where watch_time >= date_sub(curdate(), interval 30 day)) as mau_30day,
    (select count(distinct user_id)
     from watch_history
     where date(watch_time) = date_sub(curdate(), interval 1 day)) as dau_yesterday;
