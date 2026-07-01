# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.47509338525888584

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 1+2+3+10+26+30+57+68+74+78
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1POH and resi 3+9+23+26+30+45
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.482861535380575 current=33.55198046288949
color yellow, pair_00
distance pair_01, 1POH and resi 11 and name CA, 1POH and resi 67 and name CA  # target=27.448185418394193 current=32.93896446819379
color yellow, pair_01
distance pair_02, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.469482260278337 current=31.678351411257683
color yellow, pair_02
distance pair_03, 1POH and resi 56 and name CA, 1POH and resi 67 and name CA  # target=27.43965939878297 current=31.122580753939456
color yellow, pair_03
distance pair_04, 1POH and resi 57 and name CA, 1POH and resi 67 and name CA  # target=27.318517323180803 current=30.938214398909896
color yellow, pair_04
distance pair_05, 1POH and resi 11 and name CA, 1POH and resi 66 and name CA  # target=27.398056448077927 current=30.840075362538826
color yellow, pair_05
distance pair_06, 1POH and resi 9 and name CA, 1POH and resi 67 and name CA  # target=27.157178291732432 current=30.567437641453722
color yellow, pair_06
distance pair_07, 1POH and resi 30 and name CA, 1POH and resi 75 and name CA  # target=14.953082619723201 current=11.679206458729075
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
