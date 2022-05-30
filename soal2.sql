-- untuk parent_name dari Arka seharusnya Irwan (karena id irwan 3)
    -- table
    -- id  | name  | parent_id
    -- 1   | Zaki  |    2
    -- 2   | Ilham |   NULL
    -- 3   | Irwan |    2
    -- 4   | Arka  |    3

    -- expecting result
    -- id  | name  | parent_name
    -- 1   | Zaki  |    Ilham
    -- 2   | Ilham |   NULL
    -- 3   | Irwan |    Ilham
    -- 4   | Arka  |    Irwan

-- query for create table
CREATE TABLE public.peoples (
	id serial4 NOT NULL,
	"name" varchar(255) NOT NULL,
	parent_id int4 NULL,
	CONSTRAINT peoples_key PRIMARY KEY (id),
	CONSTRAINT peoples_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.peoples(id) ON DELETE CASCADE
);
-- query for insert 
insert into peoples values (1, 'Zaki', 2), (2, 'Ilham', NULL), (3, 'Irwan', 2), (4, 'Arka', 3)

-- query for select
SELECT p.id AS id, p.name AS name, p2.name AS parent_name 
FROM peoples p 
LEFT JOIN peoples p2 ON p2.id = p.parent_id
ORDER BY id ASC