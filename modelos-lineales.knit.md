---
title: "MODELOS LINEALES MIXTOS"
author: "LESLI ORTIZ ZAVALETA"
format: html
---
#librerias

::: {.cell}

```{.r .cell-code}
library(tidyverse)
```

::: {.cell-output .cell-output-stderr}

```
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.2     ✔ tibble    3.3.0
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
✔ purrr     1.0.4     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```


:::

```{.r .cell-code}
library(googlesheets4)
library(lme4)
```

::: {.cell-output .cell-output-stderr}

```
Cargando paquete requerido: Matrix

Adjuntando el paquete: 'Matrix'

The following objects are masked from 'package:tidyr':

    expand, pack, unpack
```


:::

```{.r .cell-code}
library(emmeans)
```

::: {.cell-output .cell-output-stderr}

```
Welcome to emmeans.
Caution: You lose important information if you filter this package's results.
See '? untidy'
```


:::

```{.r .cell-code}
# importar google sheets --------------------------------------------------

url <-"https://docs.google.com/spreadsheets/d/15r7ZwcZZHbEgltlF6gSFvCTFA-CFzVBWwg3mFlRyKPs/edit?gid=172957346#gid=172957346"

gs <-url %>%
  as_sheets_id()
fb <- gs %>%
  range_read(sheet = "fb") %>% 
  mutate(across(1:bloque, ~as.factor(.)))
```

::: {.cell-output .cell-output-stderr}

```
! Using an auto-discovered, cached token.
  To suppress this message, modify your code or options to clearly consent to
  the use of a cached token.
  See gargle's "Non-interactive auth" vignette for more details:
  <https://gargle.r-lib.org/articles/non-interactive-auth.html>
ℹ The googlesheets4 package is using a cached token for
  '7598354422@untrm.edu.pe'.
✔ Reading from "LA MOLINA 2014 POTATO WUE (FB)".
✔ Range ''fb''.
```


:::

```{.r .cell-code}
str(fb)
```

::: {.cell-output .cell-output-stdout}

```
tibble [150 × 18] (S3: tbl_df/tbl/data.frame)
 $ riego  : Factor w/ 2 levels "irrigado","sequia": 2 2 1 2 1 1 1 1 2 2 ...
 $ geno   : Factor w/ 15 levels "G01","G02","G03",..: 1 2 1 2 3 4 1 5 6 5 ...
 $ block  : Factor w/ 5 levels "1","2","3","4",..: 2 4 3 1 2 5 1 4 2 1 ...
 $ bloque : Factor w/ 5 levels "I","II","III",..: 2 4 3 1 2 5 1 4 2 1 ...
 $ spad_29: num [1:150] 56.3 52.7 49.2 55.5 58.2 43.5 57.4 56.1 61 60.3 ...
 $ spad_83: num [1:150] 41.1 47.9 41.6 44.2 32.6 37.8 42.5 35.9 57.5 41.8 ...
 $ rwc_84 : num [1:150] 61.5 63.2 67.7 64.9 74.5 ...
 $ op_84  : num [1:150] -2.43 -3.03 -2.5 -2.4 -2.27 ...
 $ leafdw : num [1:150] 13.28 9.42 18.22 8.84 14.55 ...
 $ stemdw : num [1:150] 14.87 8.63 24.19 6.58 12.63 ...
 $ rootdw : num [1:150] 3.83 2.1 3.16 2 1.83 2.83 2.28 3.65 4.04 4.17 ...
 $ tubdw  : num [1:150] 19.8 17.7 38 13.5 51.1 ...
 $ biomdw : num [1:150] 51.8 37.8 83.6 30.9 80.2 ...
 $ hi     : num [1:150] 0.45 0.43 0.455 0.437 0.638 ...
 $ ttrans : num [1:150] 4.5 3.54 8.39 2.9 7.37 ...
 $ wue    : num [1:150] 11.51 10.69 9.97 10.65 10.88 ...
 $ twue   : num [1:150] 4.4 4.99 4.53 4.65 6.94 ...
 $ lfa    : num [1:150] 2900 2619 7579 2450 5413 ...
```


:::
:::


# modelos

$$ wue_{tuber}= \mu + bloque + riego + geno + riego*geno + e $$

#Análisis de varianza

::: {.cell}

```{.r .cell-code}
md <- lmer(formula = twue ~ 0 + (1|bloque) + riego*geno
           , data = fb)

anova(md)
```

::: {.cell-output .cell-output-stdout}

```
Analysis of Variance Table
           npar Sum Sq Mean Sq  F value
riego         2 497.54 248.769 367.2518
geno         14 412.99  29.500  43.5494
riego:geno   14  16.06   1.147   1.6933
```


:::

```{.r .cell-code}
library(car)
```

::: {.cell-output .cell-output-stderr}

```
Cargando paquete requerido: carData
```


:::

::: {.cell-output .cell-output-stderr}

```

Adjuntando el paquete: 'car'
```


:::

::: {.cell-output .cell-output-stderr}

```
The following object is masked from 'package:dplyr':

    recode
```


:::

::: {.cell-output .cell-output-stderr}

```
The following object is masked from 'package:purrr':

    some
```


:::

```{.r .cell-code}
Anova(md)
```

::: {.cell-output .cell-output-stdout}

```
Analysis of Deviance Table (Type II Wald chisquare tests)

Response: twue
             Chisq Df Pr(>Chisq)    
riego      202.675  2     <2e-16 ***
geno       609.692 14     <2e-16 ***
riego:geno  23.706 14     0.0497 *  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```


:::
:::



