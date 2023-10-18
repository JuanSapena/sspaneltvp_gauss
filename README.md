# kf_paneltvp

This code performs time-varying parameter estimation for panel time series models using Kalman filter algorithm.

The code includes the following Files to perform Kalman filter estimation of a time-varying savings retention parameter as published in:

Camarero, M., Sapena, J., & Tamarit, C. (2019). Modelling Time-Varying Parameters in Panel Data State-Space Frameworks: An Application to the Feldstein–Horioka Puzzle. Computational Economics, 1-28.

Files:

## (1) mainpaneltvp.gss
It is the main file to be executed for a particular project.

The file needs to be adapted to the project to particularise the following issues:
1. Project name
1. Data transformation (if needed).
1. Model specification, that includes:
    - Dependent variable for the measurement equation, **y**.
    - Measurement equation regressors with (a potentially) idiosyncratic fixed coefficient, **measdep**
    - Measurement equation regressors with a common fixed coefficient, **measdepc**
    - Measurement equation regressors with a time-varying coefficient, **measdepv**
    - State transition equation control inputs with a (potentially) idiosyncratic fixed parameter, **statedep**
    - State transition equation control inputs with a (potentially) idiosyncratic fixed parameter, **statedepc**
1. Data (either idiosyncratic or common) preparation for creating figures,

The main file **mainpaneltvp.gss** invokes the following (mandatory) files that need to be adapted:

## (2) consolepaneltvp.gss
This file is invoked from **mainpaneltvp.gss** to ask the practitioner for the main elements of the model.
It prompts the practitioner to select countries, period, and different elements that permit the hyperparameter vector to be defined.
In this version, the file still needs to be sligtly adapted to the project to display the country list and the estimation period.

## (3) readdatapaneltvp.gss
This piece code is also invoked from **mainpaneltvp.gss** to read input panel data from an excel file.
In this version, the file still needs to be sligtly adapted to the project to find the excel data file, and to create variables.

**mainpaneltvp.gss** also includes optional elements in:

## (4) datasplitnegpos.gss
This piece code splits a single variable into two, by separating negative and positive values of the original. 
This can be useful for detecting assymmetric coefficients.
It also permits any split other than zero cut line.

## (5) gen_purinputdata,gss
This simple piece code generates an excel workbook including the data that will be used to perform Bai and Carrion (2009) PUR tests. 


The main file **mainpaneltvp.gss** also invokes the following (mandatory) files that don't need to be adapted:

## (6) kfseekpaneltvp.gss
**kfseekpaneltvp.gss** drives the numerical optimization of the Kalman filter estimation. It requires Aptech Gauss Package **optmum**.
It invokes **kfiltpaneltvp.gss** to run the KF algorithm for the model, stores estimated time-varying parameters and hyperparameters,
and finally calls **kfgraphpaneltvp.gss** to generate plots.

## (7) kfiltpaneltvp.gss 
kfiltpaneltvp.gss is invoked by kfseekpaneltvp.gss to run the kalman filter algorithm.  It doesn't need to be adapted.  
 
## (8) kfgrappaneltvp.gss
This file is also invoked from kfseekpaneltvp.gss and plots output graphics. It doesn't need to be adapted.


The folder **\data** includes the input data excel file wich is called from the codes. 
Output files (tkf figures and excel files) are storede in the folder **\out**.


