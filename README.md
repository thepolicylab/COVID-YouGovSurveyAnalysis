# YouGov COVID Survey Analysis

This repository contains code that was used to generate the analysis of our first statewide survey with YouGov. This README provides instructions on replicating.

## Requriements

This analysis was carried out in SPSS. If you're at Brown, you can get a copy of SPSS by visiting [software.brown.edu](https://software.brown.edu). After you've procured that software, you should just be able to run the scripts in this folder.

## Instructions

The data are provided in SPSS `.sav` formats. They can be found in the `/data` folder. In particular,

* Data from the Rhode Island sample can be found in `/data/TPL_Testing_Survey_FirstWave_RI.sav`.
* Data from the national sample can be found in `/data/TPL_Testing_Survey_FirstWave_US.sav`.

To reproduce the analyses, perform the following steps:

1. Launch SPSS
2. Select `Open` > `Data` and choose either `TPL_Testing_Survey_FirstWave_RI.sav` or `TPL_Testing_Survey_FirstWave_US.sav` data file
3. Select `Open` > `Syntax` and choose the desired segment of the analysis. Note that they are named in order that they appear in the ultimate report.
4. Select all commands and click `Run`

Note that _qualitative_ results can be found in the `/data/qualitative` folder.

## A note for Python users

If you'd like to look at the data and aren't an SPSS user, you can open it with the [`pyreadstat`](https://github.com/Roche/pyreadstat) package. To do so, we suggest the following syntax:

```python
import pyreadstat

df, metadata = pyreadstat.read_sav('data/TPL_Testing_Survey_FirstWave_RI.sav')
```

The resulting `df` is a pandas dataframe. The `metadata` can be inspected to find the details of the questions asked.

## A note for R users

We are using `renv` to manage package dependencies. So you will need this installed in your system first.

When you first start R in the root directory of this project you should do `renv::init()` and then `renv::restore()` to ensure that you have the packages needed for analysis.

Then, again, from the root of the project directory, you should be able to build a pdf document like so (if you have latex installed on your system):

```r
library(rmarkdown)
render('analysis/outcome_analysis.Rmd`)
```


## License

MIT
