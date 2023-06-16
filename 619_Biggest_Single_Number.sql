# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists MyNumbers_15
(
num int
);

Truncate table MyNumbers_15;

insert into MyNumbers_15 (num) values ('8');
insert into MyNumbers_15 (num) values ('8');
insert into MyNumbers_15 (num) values ('3');
insert into MyNumbers_15 (num) values ('3');
insert into MyNumbers_15 (num) values ('1');
insert into MyNumbers_15 (num) values ('4');
insert into MyNumbers_15 (num) values ('5');
insert into MyNumbers_15 (num) values ('6');

/*
Q. A single number is a number that appeared only once in the MyNumbers table.
Write an SQL query to report the largest single number. If there is no single number, report null.
The query result format is in the following example.

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
Explanation: The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.
Example 2:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+
Output: 
+------+
| num  |
+------+
| null |
+------+
Explanation: There are no single numbers in the input table so we return null.
*/

SELECT * FROM MyNumbers_15;

# TYPE 1 :- NOT IN & SUB-QUERY
SELECT MAX(num) AS num
FROM MyNumbers_15
WHERE num 
NOT IN ( SELECT * 
FROM MyNumbers_15
GROUP BY num
HAVING COUNT(num)>=2);

# TYPE 2 :- SUB-QUERY
SELECT MAX(num) AS num
FROM (
  SELECT num
  FROM MyNumbers_15
  GROUP BY num
  HAVING COUNT(*) = 1
) AS single_nums;

