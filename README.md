# kf_paneltvp

This code performs time-varying parameter estimation for panel time series models using Kalman filter algorithm.

The code includes the following Files to perform Kalman filter estimation of a time-varying savings retention parameter as published in:

Camarero, M., Sapena, J., & Tamarit, C. (2025). Introducing \textit{sspaneltvp}: a code to estimating state-space time-varying parameter models in panels. An application to Okun's law, forthcoming in *Studies in Nonlinear Dynamics \& Econometrics*.
(*)The file **sspaneltvp_okun_specification.TXT** contains choices made for the 'Okun' example.

To execute the code a numerical optimizer is required. Two options:
- OPTMT, Gauss numerical optimizer (that can be purchased from Aptech webpage)
- OPTMUM, a former numerical optimizer (included in the bundle).

NOTE: RESEARCHERS NEEDING ASSISTANCE FOR IMPLEMENTATING THE CODE TO OTHER MODELS ARE WELCOME TO ASK FOR HELP TO: juan.sapena@ucv.es

Files included:

## (1) mainpaneltvp.gss
It is the main file to be EXECUTED for a particular project.

The file needs to be adapted to the project to particularise the following issues:
1. Indicate the numerical optimizer installed. 
For '__opt_mt = 1', OPTMT is required, else the code expects OPTMUM package installed.
2. Indicate the project name
3. Data transformation (if needed).
4. Model specification, that includes:
    - Dependent variable for the measurement equation, **y**.
    - Measurement equation regressors with (a potentially) idiosyncratic fixed coefficient, **measdep**
    - Measurement equation regressors with a common fixed coefficient, **measdepc**
    - Measurement equation regressors with a time-varying coefficient, **measdepv**
    - State transition equation control inputs with a (potentially) idiosyncratic fixed parameter, **statedep**
    - State transition equation control inputs with a (potentially) idiosyncratic fixed parameter, **statedepc**
5. Data (either idiosyncratic or common) preparation for creating figures,

The main file **mainpaneltvp.gss** invokes the following (mandatory) files that need to be adapted:

## (2) consolepaneltvp.gss
This file is invoked from **mainpaneltvp.gss** to ask the practitioner for the main elements of the model.
It prompts the practitioner to select countries, period, and different elements that permit the hyperparameter vector to be defined.
In this version, the file still needs to be sligtly adapted to the project to display the country list and the estimation period.

## (3) readdatapaneltvp.gss
This piece code is also invoked from **mainpaneltvp.gss** to read input panel data from an excel file.
In this version, the file still needs to be sligtly adapted to the project to find the excel data file, and to create variables.

**mainpaneltvp.gss** also includes optional elements in:

## (4) datasplitnegpos.gss (optional)
This piece code splits a single variable into two, by separating negative and positive values of the original. 
This can be useful for detecting assymmetric coefficients.
It also permits any split other than zero cut line.

## (5) gen_purinputdata,gss (optional)
This simple piece code generates an excel file containing the data to be be used to perform Bai and Carrion (2009) PUR tests. 

The main file **mainpaneltvp.gss** also invokes the following (mandatory) files that don't need to be adapted:

## (6a) kfseekpaneltvp.gss
**kfseekpaneltvp.gss** drives the numerical optimization of the Kalman filter estimation. It requires Aptech Gauss Package **optmum**.
It invokes **kfiltpaneltvp.gss** to run the KF algorithm for the model, stores estimated time-varying parameters and hyperparameters,
and finally calls **kfgraphpaneltvp.gss** to generate plots.

## (6b) kfseekpaneltvp_mod.gss (alternative to 6a)
**kfseekpaneltvp_mod.gss** drives the numerical optimization of the Kalman filter estimation. It requires Aptech Gauss Package **OPTMT**.
It invokes **kfiltpaneltvp.gss** to run the KF algorithm for the model, stores estimated time-varying parameters and hyperparameters,
and finally calls **kfgraphpaneltvp.gss** to generate plots.

## (7) kfiltpaneltvp.gss 
This file is invoked by **kfseekpaneltvp.gss** or **kfseekpaneltvp_mod.gss** to run the kalman filter algorithm. It doesn't need to be adapted.  
 
## (8a) kfgrappaneltvp.gss
This file is also invoked from **kfseekpaneltvp.gss** and plots output graphics. It doesn't need to be adapted.

## (8b) kfgrappaneltvp_mod.gss (alternative to 8a)
This file is invoked from **kfseekpaneltvp_mod.gss** and plots output graphics when using GAUSS 12 OR ABOVE. It doesn't need to be adapted.

The folder **\data** includes the input data excel file wich is called from the codes.

The folder **\out** stores output files (tkf figures and excel files).
