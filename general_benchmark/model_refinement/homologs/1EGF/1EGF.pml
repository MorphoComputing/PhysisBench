# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.0258322031575045

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 1+2+3+4+6+24+25+49+50+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1EGF and resi 7 and name CA, 1EGF and resi 21 and name CA  # target=11.412465578405099 current=8.936754239264411
color yellow, pair_00
distance pair_01, 1EGF and resi 21 and name CA, 1EGF and resi 34 and name CA  # target=17.979254014088117 current=20.2543320529804
color yellow, pair_01
distance pair_02, 1EGF and resi 21 and name CA, 1EGF and resi 31 and name CA  # target=9.483837300381404 current=11.661981959925924
color yellow, pair_02
distance pair_03, 1EGF and resi 22 and name CA, 1EGF and resi 51 and name CA  # target=22.78697928639955 current=24.897475710021435
color yellow, pair_03
distance pair_04, 1EGF and resi 21 and name CA, 1EGF and resi 51 and name CA  # target=23.372938831519004 current=25.469169069371873
color yellow, pair_04
distance pair_05, 1EGF and resi 21 and name CA, 1EGF and resi 33 and name CA  # target=16.070492484992368 current=18.10366367424043
color yellow, pair_05
distance pair_06, 1EGF and resi 21 and name CA, 1EGF and resi 35 and name CA  # target=19.757773471978215 current=21.784877063274376
color yellow, pair_06
distance pair_07, 1EGF and resi 8 and name CA, 1EGF and resi 21 and name CA  # target=11.898908082411596 current=9.878164415180308
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
