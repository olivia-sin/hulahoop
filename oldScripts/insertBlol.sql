CREATE TABLE MyBLOBTable
   (blob_id int IDENTITY(1,1),
   blob_description varchar(256),
   blob_data varbinary(max))

   INSERT INTO
    MyBLOBTable (blob_description,
      blob_data)
SELECT 'Windows Server', 
   BulkColumn FROM Openrowset( 
      Bulk '\\psf\Home\Pictures\pig2.bmp', 
      SINGLE_BLOB) AS blob

select * from MyBLOBTable