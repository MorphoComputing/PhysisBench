# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6373305399056628

load 1TIT.pdb, 1TIT
bg_color white
hide everything, 1TIT
show cartoon, 1TIT
color grey80, 1TIT
set cartoon_transparency, 0.1

select worst_residues, 1TIT and resi 4+14+15+25+26+55+56+68+74+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TIT and resi 29+59+75+448+679+1143
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TIT and resi 28 and name CA, 1TIT and resi 87 and name CA  # target=27.17467156832688 current=36.32784919972398
color yellow, pair_00
distance pair_01, 1TIT and resi 1 and name CA, 1TIT and resi 55 and name CA  # target=21.381391709802852 current=12.247167019054324
color yellow, pair_01
distance pair_02, 1TIT and resi 28 and name CA, 1TIT and resi 65 and name CA  # target=23.481858608565044 current=31.98820418559037
color yellow, pair_02
distance pair_03, 1TIT and resi 27 and name CA, 1TIT and resi 87 and name CA  # target=27.262060160559276 current=35.72707076414191
color yellow, pair_03
distance pair_04, 1TIT and resi 34 and name CA, 1TIT and resi 55 and name CA  # target=18.746482159398656 current=10.476817973903113
color yellow, pair_04
distance pair_05, 1TIT and resi 25 and name CA, 1TIT and resi 68 and name CA  # target=19.204731811375105 current=27.45468052471302
color yellow, pair_05
distance pair_06, 1TIT and resi 28 and name CA, 1TIT and resi 86 and name CA  # target=26.659151112534314 current=34.88804583117299
color yellow, pair_06
distance pair_07, 1TIT and resi 28 and name CA, 1TIT and resi 37 and name CA  # target=14.75733084122427 current=22.89843636778546
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
