-- Are there museums without any paintings?

select * from museum m
where not exists (
    select 1
    from work w
    where w.museum_id = m.museum_id
)