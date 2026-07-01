# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.0942056047032106

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 1+3+7+8+12+17+43+58+60+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SN3 and resi 20 and name CA, 1SN3 and resi 62 and name CA  # target=27.48787984693643 current=28.78588609159617
color yellow, pair_00
distance pair_01, 1SN3 and resi 18 and name CA, 1SN3 and resi 61 and name CA  # target=27.463964134110014 current=28.137625886867056
color yellow, pair_01
distance pair_02, 1SN3 and resi 26 and name CA, 1SN3 and resi 63 and name CA  # target=23.53627179995238 current=24.202704976426592
color yellow, pair_02
distance pair_03, 1SN3 and resi 25 and name CA, 1SN3 and resi 63 and name CA  # target=23.308963744008945 current=23.938247651040808
color yellow, pair_03
distance pair_04, 1SN3 and resi 20 and name CA, 1SN3 and resi 59 and name CA  # target=24.20910602958775 current=24.83677053273848
color yellow, pair_04
distance pair_05, 1SN3 and resi 25 and name CA, 1SN3 and resi 60 and name CA  # target=23.43304962642282 current=24.05913808251335
color yellow, pair_05
distance pair_06, 1SN3 and resi 31 and name CA, 1SN3 and resi 63 and name CA  # target=23.62363108723508 current=24.244586773532635
color yellow, pair_06
distance pair_07, 1SN3 and resi 26 and name CA, 1SN3 and resi 61 and name CA  # target=23.995403331138956 current=24.586241724653686
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
