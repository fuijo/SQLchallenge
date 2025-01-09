# sqlchallenge

**Pewlett Hackard Employee Database Analysis**
This project involved designing and implementing a relational database system to analyze historical employee data from Pewlett Hackard, focusing on employees from the 1980s and 1990s. The tasks encompassed data modeling, data engineering, and data analysis, enabling a structured approach to transform raw CSV files into actionable insights.

**Deliverables**
**1. Data Modeling**
**Entity-Relationship Diagram (ERD):**
An ERD was developed to define relationships between six datasets, ensuring clarity on primary keys, foreign keys, and table interdependencies.
Tables included entities such as employees, departments, titles, salaries, and department managers, with relationships linking employees to their departments and roles.
**2. Data Engineering**
**Schema Design:**

Defined table schemas for each dataset with appropriate data types, constraints, and relationships:
Primary keys ensured uniqueness in entities like employee ID and department ID.
Foreign keys established relationships between employees, departments, and job roles.
Composite keys were created where necessary, such as linking titles to employees with validity dates.
Constraints such as NOT NULL were applied to mandatory columns, ensuring data integrity.
**Data Import:**

Loaded all six CSV files into the SQL database, ensuring accurate mapping and adherence to the schema.
Established correct table creation order to maintain foreign key integrity.

**3. Data Analysis**
Utilized SQL queries to extract meaningful insights from the employee database:

**Employee Details:**

Listed employee numbers, names, sex, and salaries, offering a comprehensive view of individual records.
Hire Trends:

Identified employees hired in 1986, revealing hiring patterns during a specific year.
Department Management:

Provided details on department managers, including their department number, name, and employee information.
Employee Department Allocation:

Displayed department numbers and names alongside employee details for each assigned department.

**Targeted Searches:**

Identified employees named "Hercules" with last names starting with "B".
Listed employees in specific departments like Sales and Development, offering insights into department composition.

**Name Frequency Analysis:**

Counted and ranked employee last names by frequency, uncovering patterns in surname distributions.
Key Insights and Trends

**Departmental Allocation:**

The Sales and Development departments had the highest employee counts, reflecting their significance within the company.
Name Frequency:

Certain last names were more common, suggesting potential familial or regional hiring patterns.

**Managerial Roles:**

Analysis of department managers provided insights into leadership tenure and departmental structure during the 1980s and 1990s.

**Conclusion**
The project successfully transformed raw employee data into a structured SQL database, enabling detailed analysis of historical hiring patterns, departmental composition, and employee demographics. This foundational database can now serve as a resource for deeper exploration of historical trends and strategic planning.
