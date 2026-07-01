# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.4719744335598428

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 4+7+8+14+15+21+30+32+33+34
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 1 and name CA, 1VII and resi 33 and name CA  # target=13.736079169445969 current=9.67144781346771
color yellow, pair_00
distance pair_01, 1VII and resi 6 and name CA, 1VII and resi 33 and name CA  # target=13.50316250843076 current=10.133944780704859
color yellow, pair_01
distance pair_02, 1VII and resi 2 and name CA, 1VII and resi 33 and name CA  # target=17.126836688781122 current=13.786967646661823
color yellow, pair_02
distance pair_03, 1VII and resi 5 and name CA, 1VII and resi 33 and name CA  # target=14.6304205445701 current=11.478639347296248
color yellow, pair_03
distance pair_04, 1VII and resi 4 and name CA, 1VII and resi 33 and name CA  # target=18.016332925910636 current=15.167102526939685
color yellow, pair_04
distance pair_05, 1VII and resi 3 and name CA, 1VII and resi 33 and name CA  # target=18.120564567831195 current=15.277921216874402
color yellow, pair_05
distance pair_06, 1VII and resi 9 and name CA, 1VII and resi 33 and name CA  # target=10.458240469899051 current=7.8639183830619315
color yellow, pair_06
distance pair_07, 1VII and resi 7 and name CA, 1VII and resi 33 and name CA  # target=15.549889886443214 current=13.209225455273815
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
