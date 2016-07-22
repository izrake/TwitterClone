select * from UserDetail

select * from Following

select * from UserDetail where [user_id] not in (select following_id 
from Following where [user_id]='prins' ) and [user_id] !='prins'

select * from (select following_id from Following where [user_id]='prins') F join 
UserDetail U on  f.following_id=U.[user_id]

sp_help userdetail