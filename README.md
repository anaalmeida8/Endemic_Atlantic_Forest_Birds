# Endemic_Atlantic_Forest_Birds

Title of dataset:
Bird defaunation leads to the loss of key ecosystem services in the Atlantic Forest

Authors:
Ana Claudia Almeidaa, Juliano A. Bogoni, Clinton N. Jenkins, Mauricio Almeida-Gomes


Corresponding author:
Ana Claudia Almeida, Programa de Pós-graduação em Ecologia e Conservação (PPGEC), Universidade Federal de Mato Grosso do Sul, Av. Costa e Silva, 79070-900, Campo Grande, MS, Brazil. Email: acalmeida.bio@gmail.com

Date of data collection:
2021–2023

Taxonomic coverage:
65 endemic and threatened bird species of the Atlantic Forest, as defined by Vale et al. (2018b) and Prado et al. (2022).


Data Description
Overview

This dataset contains the input data, derived matrices, and simulation outputs used to evaluate the effects of bird defaunation on ecosystem services (ES) in the Atlantic Forest under different defaunation scenarios (low, medium, and high). The analyses were conducted using ecological network metrics implemented in R (version 4.3.0).

Files and Contents

1.	"pres_abs.csv": Presence–absence matrix of each species in 10,000-ha hexagons covering the Atlantic Forest (1 = present, 0 = absent).
2. "eco_services.csv": Matrix indicating the ecosystem services provided by each bird species based on diet, body mass, and behavior traits. Columns include: pollination, pest_control, seed_dispersal, seed_predation, biological_control, ecosystem_engineering, food, and birdwatching.
3. "spdata" file: Species range maps (shapefiles).
4. "shapefiles" file: hexagons and Neotropical realm shapefiles.
5. "baseline and defaunation scenarios" file: Matrix of species' presence and absence in the baseline and defaunated (low, medium, and high) scenarios.
6. "ecosystem services scenarios" file: Matrix of ecosystem services per hexagon in the baseline scenario (before simulated defaunation) and for for low, medium, and high defaunation scenarios.
7. "scripts" file: R scripts used to conduct the analyses, including simulations and network metric calculations.

References

Bogoni, J.A., Peres, C.A., Ferraz, K.M.P.M.B., 2020. Effects of mammal defaunation on natural ecosystem services and human well being throughout the entire Neotropical realm. Ecosyst. Serv. 45, 101173. https://doi.org/10.1016/j.ecoser.2020.101173.

Michel, N.L., Whelan, C.J., Verutes, G.M., 2020. Ecosystem services provided by Neotropical birds. The Condor 122 (3), duaa022. https://doi.org/10.1093/condor/duaa022.

Prado, L.C., Dias, T.C., Araújo, L.W.L., Silveira, L.F., Francisco, M.R., 2022. Population density estimates and key microhabitat parameters for two endangered tropical forest understory insectivorous passerines from the Pernambuco Endemism Center. Avian Conserv. Ecol. 17 (2), 22. https://doi.org/10.5751/ACE-02231-170222.

Vale, M.M., Tourinho, L., Lorini, M.L., Rajão, H., Figueiredo, M.S.L., 2018b. Endemic birds of the Atlantic Forest: traits, conservation status, and patterns of biodiversity. J. Field Ornithol. 89 (3), 193–206. https://doi.org/10.1111/jofo.12256.
