<p align="center">
  <img src="https://github.com/ewang2002/UCSDHistEnrollData/blob/master/misc/assets/project_banner.png?raw=true"  alt="Project Banner"/>
</p>

<p align="center">
  <a href="https://github.com/ewang2002/webweg">webweg</a> |
  <a href="https://github.com/ewang2002/webreg_scraper">webreg_scraper</a> |
  <b>UCSDHistEnrollmentData</b>
</p>

A repository that 
- branches out to multiple children repositories containing enrollment data for multiple terms at UC San Diego.
- contains some other other UCSD-related [data files](https://github.com/ewang2002/UCSDHistEnrollData/tree/master/data) that may be helpful.

## Data
You can find historical enrollment data linked below. Documentation can be found further below. To see how often the data is being updated, click [here](https://github.com/ewang2002/UCSDHistEnrollData/issues/1). That being said, I try to update term data during first and second pass once a day (usually in the evening) and once every week or two during other times.

To see the other UCSD-related data files, go to the [`data`](https://github.com/ewang2002/UCSDHistEnrollData/tree/master/data) folder.

> **Note**:
> **This** repository simply contains a bunch of random scripts to help me clean up and process the enrollment data, documentation regarding how the CSV files are structured, and links to the sibling repositories. **Each sibling repository** contains CSV files which contains information regarding the number of seats available at some time for certain classes. There are also some scripts designed to help clean and analyze the data. Additionally, there are pre-generated plots of each course that is being tracked.

### Limited Data (Prior to FA22)
The following repositories only contain _limited_ data, and were intended to be long-term test runs to see if the project was feasible. Note that Spring 2022 enrollment data is formatted differently from the data found in other data repositories.

| Term | Information | Data Collected | Link |
| ---- | ----------- | -------------- | ---- |
| SP22 | Spring 2022 Enrollment Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Spring) |
| SP22D | Spring 2022 Drop Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022SpringDrop) |
| S122 | Summer I 2022 Enrollment Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Summer1) |
| S122D | Summer I 2022 Drop Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Summer1Drop) |
| S222 | Summer II 2022 Enrollment Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Summer2) |
| S222D | Summer II 2022 Drop Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Summer2Drop) |
| S322 | Summer III 2022 Data | CSE, COGS, MATH, ECE undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Summer3) |

### Full Data
Starting with FA22, 
- enrollment and drop data will be integrated into one term folder. 
- graduate courses from specific departments will be collected[^1].
- all undergraduate courses will be collected.

| Term | Information | Data Collected | Link |
| ---- | ----------- | -------------- | ---- |
| FA22 | Fall 2022 Enrollment & Drop Data (Undergraduate Only) | All undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022Fall) |
| FA22G | Fall 2022 Enrollment & Drop Data (Graduate Only) | CSE, COGS, MATH, ECE graduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2022FallGrad) |
| WI23 | Winter 2023 Enrollment & Drop Data (Undergraduate Only) | All undergraduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2023Winter) |
| WI23G | Winter 2023 Enrollment & Drop Data (Graduate Only) | CSE, COGS, MATH, ECE graduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2023WinterGrad) |
| SP23 | Spring 2023 Enrollment & Drop Data | All undergraduate courses & CSE, COGS, MATH, ECE graduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2023Spring) |
| FA23 | Fall 2023 Enrollment & Drop Data | All undergraduate courses & CSE, COGS, MATH, ECE graduate courses | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2023Fall) |

### Incomplete Data (Starting FA22)
Below, you can find incomplete data. Incomplete data is defined as data with a significant number of missing datapoints (essentially rendering them significantly less valuable than regular datasets).

| Term | Information | Data Collected | Link |
| ---- | ----------- | -------------- | ---- |
| S123 | Summer I 2023 Raw Data | All undergraduate courses (raw data only, see repository for more info) | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2023Summer1) |
| S223 | Summer II 2023 Raw Data | All undergraduate courses (raw data only, see repository for more info) | [Here](https://github.com/UCSD-Historical-Enrollment-Data/2023Summer2) |


## Documentation
Below, you can find some documentation to get you started.
- [Background and Acknowledgements](https://github.com/ewang2002/UCSDHistEnrollData/blob/master/docs/background.md)
- [CSV Information and Structure](https://github.com/ewang2002/UCSDHistEnrollData/blob/master/docs/csv_info.md)
- [Data Repository Information and Structure](https://github.com/ewang2002/UCSDHistEnrollData/blob/master/docs/data_repo_info.md)
- [Scripts](https://github.com/ewang2002/UCSDHistEnrollData/blob/master/docs/scripts.md)
- [Setup](https://github.com/ewang2002/UCSDHistEnrollData/blob/master/docs/setup.md)


## License
All files here and in the data repositories are licensed under the MIT license. If you'd like an explicit LICENSE file in the data repositories, please let me know.

You're free to use this data for your own projects, but please be sure to cite this repository when using data found here so other people can use the data for their own projects.


[^1]: Graduate courses are not formally supported. Once I stop collecting undergraduate course enrollment data, I will also stop collecting graduate course enrollment data, which means some data (e.g., drop with W deadline) will not be collected.