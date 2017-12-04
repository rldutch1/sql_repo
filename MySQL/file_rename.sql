select videoname CurrentName, replace(replace(videoname,' ','_'),'_-_','_') NewName, replace(videoname,'.webm','') Description, lpad(id,3,0) from jquery_videos;

select videoname CurrentName, replace(replace(videoname,' ','_'),'_-_','_') NewName, replace(videoname,'.webm','') Description, lpad(id,3,0) from jquery_videos;


select replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_','') NewName from jquery_videos;
select lpad(substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_','1'),3,0) NewName, id from jquery_videos;


Remove everything in front of a character. In this case '#'.
select substring('test#hello', instr('test#hello', '#') + 1) as Remove_Everything_in_Front_of_Pound;

This removes the first two octets and replaces them with an empty string so that only the last two octets are displayed.
select '192.168.11.1', replace('192.168.11.1',substring_index('192.168.11.1','.',2), '');

select concat('mv ',oldname,' ',newnum,'.',substring_index(oldname,'.',-2)) as Rename_Script

*select concat('jQuery_Tutorial_',lpad(substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_','1'),3,0)) NewName, id from jquery_videos;

select substring('test#hello', instr('test#hello', '#') + 1) as Remove_Everything_in_Front_of_Pound;

select replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_','') NewName from jquery_videos;
select substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1) NewName from jquery_videos;
*select replace(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1),'') NewName from jquery_videos;

*create view vw_jquery_videos as
select id, videoname OriginalName, concat('jQuery_Tutorial_',lpad(substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_','1'),3,0),replace(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1),'')) NewName, trim(replace(replace(replace(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1),''),'_',' '),'.webm','')) Description from jquery_videos;


-- Description
select trim(replace(replace(replace(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),substring_index(replace(replace(replace(videoname,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1),''),'_',' '),'.webm','')) Description from jquery_videos;

select concat('mv "', originalname, '" ', newname) filerename from vw_jquery_videos;

-- File Rename:
CREATE VIEW `vw_jquery_videos` AS select `jquery_videos`.`id` AS `id`,`jquery_videos`.`videoname` AS `OriginalName`,concat('jQuery_Tutorial_',lpad(substring_index(replace(replace(replace(`jquery_videos`.`videoname`,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_','1'),3,0),replace(replace(replace(replace(`jquery_videos`.`videoname`,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),substring_index(replace(replace(replace(`jquery_videos`.`videoname`,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1),'')) AS `NewName`,trim(replace(replace(replace(replace(replace(replace(`jquery_videos`.`videoname`,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),substring_index(replace(replace(replace(`jquery_videos`.`videoname`,' ','_'),'_-_','_'),'jQuery_Tutorial_',''),'_',1),''),'_',' '),'.webm','')) AS `Description` from `jquery_videos`;
