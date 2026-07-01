# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4980176746039541

load 1IB9.pdb, 1IB9
bg_color white
hide everything, 1IB9
show cartoon, 1IB9
color grey80, 1IB9
set cartoon_transparency, 0.1

select worst_residues, 1IB9 and resi 1+4+8+10+16+18+19+22+24+31
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1IB9 and resi 13
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1IB9 and resi 15 and name CA, 1IB9 and resi 25 and name CA  # target=6.905520093754439 current=10.020245168759821
color yellow, pair_00
distance pair_01, 1IB9 and resi 7 and name CA, 1IB9 and resi 31 and name CA  # target=13.549186174794217 current=11.145274326061049
color yellow, pair_01
distance pair_02, 1IB9 and resi 9 and name CA, 1IB9 and resi 28 and name CA  # target=17.810966340233815 current=15.408688018605543
color yellow, pair_02
distance pair_03, 1IB9 and resi 14 and name CA, 1IB9 and resi 25 and name CA  # target=10.346466177997161 current=8.12174315955777
color yellow, pair_03
distance pair_04, 1IB9 and resi 12 and name CA, 1IB9 and resi 20 and name CA  # target=8.95029592407034 current=6.744163614966217
color yellow, pair_04
distance pair_05, 1IB9 and resi 12 and name CA, 1IB9 and resi 29 and name CA  # target=12.736900975194706 current=10.535456668611257
color yellow, pair_05
distance pair_06, 1IB9 and resi 6 and name CA, 1IB9 and resi 14 and name CA  # target=12.466941767378692 current=14.588350271020811
color yellow, pair_06
distance pair_07, 1IB9 and resi 5 and name CA, 1IB9 and resi 19 and name CA  # target=10.409742336142708 current=12.457997120829445
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
