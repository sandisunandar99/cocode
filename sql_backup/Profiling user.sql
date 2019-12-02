-- roles users	
select a.role_id, a.user_id, b.slug from role_user a
	inner join roles b on a.role_id = b.id
	
	
-- permission users
select a.permission_id, a.user_id, b.slug from permission_user a
	inner join permissions b on a.permission_id = b.id
	


-- role permission
select a.permission_id, a.role_id, b.slug, c.slug from permission_role a
	inner join roles b on a.role_id = b.id
	inner join permissions c on a.permission_id =c.id 
	
	

select * from roles;

select * from permissions;

select * from users;



-- user join role - permission
select x.*, y.roles, z.permissions from users x left join (
		select a.role_id, a.user_id, b.slug roles from role_user a
			inner join roles b on a.role_id = b.id
	) y on x.id = y.user_id 
	left join (
		select a.permission_id, a.role_id, b.slug roles1, c.slug permissions from permission_role a
		inner join roles b on a.role_id = b.id
		inner join permissions c on a.permission_id =c.id 
	) z on y.role_id = z.role_id


	
-- user join permission
select x.*, y.slug from users x
	left join (
		select a.permission_id, a.user_id, b.slug from permission_user a
			inner join permissions b on a.permission_id = b.id	
	) y on x.id = y.user_id


	
-- VIEW USER ROLE PERMISSION
-- create or replace view v_user_role_permission as
select x.*, b.slug roles, f.slug permission from users x 
	left join role_user a on  x.id = a.user_id
		left join roles b on a.role_id = b.id 
	left join permission_role c on a.role_id = c.role_id
		left join roles e on c.role_id = e.id
		left join permissions f on c.permission_id = f.id 
;		
		

-- VIEW USER PERMISSION
-- create or replace view v_user_permission as
select x.*, b.slug permission from users x
	left join permission_user a on x.id = a.user_id
		left join permissions b on a.permission_id = b.id	
;
		
		

select * from v_user_role_permission;
	
select * from v_user_permission;