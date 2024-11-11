#NEXUS

begin trees;
tree intree = [&R]  ((((((Heteropoda_tetrica:0.0114563903,Heteropoda_simplex:0.0128096956):0.0017248466,Heteropoda_venatoria:0.0087006082):0.0041759645,Heteropoda_davidbowie:0.0128569586):0.133918881,((Latrodectus_geometricus:0.020856323,(Latrodectus_hasselti:0.01064592,Latrodectus_hesperus:0.0089872463):0.0113693612):0.1413519401,((Trichonephila_inaurata:0.0176286481,Trichonephila_clavipes:0.0173544259):0.0072495833,(Trichonephila_plumipes:0.0077948136,(Trichonephila_antipodiana:0.006397272,Trichonephila_clavata:0.007273375):0.001906895):0.0070768726):0.1487752418):0.0419507463):0.1342897526,(Loxosceles_rufescens:0.0431350688,(Loxosceles_deserta:0.0127505675,Loxosceles_reclusa:0.0108669958):0.0320887781):0.2087397341):0.2167316556,Centruroides_vittatus:0.2167316556):0.0;
end;

begin rates;
blformat nsites=49002 lengths=persite;
collapse;

mrca Trichonephila_antipodiana_Trichonephila_clavata = (Trichonephila_antipodiana, Trichonephila_clavata);
constrain taxon=Trichonephila_antipodiana_Trichonephila_clavata min=7.4 max=11.0 median=9.2;

mrca Trichonephila_plumipes_Trichonephila_clavata = (Trichonephila_plumipes, Trichonephila_clavata);
constrain taxon=Trichonephila_plumipes_Trichonephila_clavata median=14.2;

mrca Trichonephila_inaurata_Trichonephila_clavipes = (Trichonephila_inaurata, Trichonephila_clavipes);
constrain taxon=Trichonephila_inaurata_Trichonephila_clavipes median=15.1;

mrca Heteropoda_davidbowie_Heteropoda_venatoria = (Heteropoda_davidbowie, Heteropoda_venatoria);
constrain taxon=Heteropoda_davidbowie_Heteropoda_venatoria median=22.9;

mrca Loxosceles_deserta_Loxosceles_reclusa = (Loxosceles_deserta, Loxosceles_reclusa);
constrain taxon=Loxosceles_deserta_Loxosceles_reclusa median=10.8;

mrca Loxosceles_rufescens_Loxosceles_reclusa = (Loxosceles_rufescens, Loxosceles_reclusa);
constrain taxon=Loxosceles_rufescens_Loxosceles_reclusa min=22.1 max=43.4 median=33;

mrca Loxosceles_rufescens_Centruroides_vittatus = (Loxosceles_rufescens, Centruroides_vittatus);
constrain taxon=Loxosceles_rufescens_Centruroides_vittatus min=375.2 max=442.3 median=397;

divtime method=lf algorithm=tn;
showage;

describe plot=chronogram;
describe plot=tree_description;

set num_time_guesses=3;
divtime method=lf algorithm=tn;
showage;

end;