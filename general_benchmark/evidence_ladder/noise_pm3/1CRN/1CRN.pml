# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.5902524835168763

load 1CRN.pdb, 1CRN
bg_color white
hide everything, 1CRN
show cartoon, 1CRN
color grey80, 1CRN
set cartoon_transparency, 0.1

select worst_residues, 1CRN and resi 1+2+3+7+14+17+41+42+43+44
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CRN and resi 14+44+105+315
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CRN and resi 32 and name CA, 1CRN and resi 42 and name CA  # target=5.647644790116271 current=13.86353438729937
color yellow, pair_00
distance pair_01, 1CRN and resi 20 and name CA, 1CRN and resi 33 and name CA  # target=19.93432110307047 current=12.282962632940137
color yellow, pair_01
distance pair_02, 1CRN and resi 28 and name CA, 1CRN and resi 42 and name CA  # target=11.705795579283404 current=19.241054980845824
color yellow, pair_02
distance pair_03, 1CRN and resi 31 and name CA, 1CRN and resi 43 and name CA  # target=15.775526576196974 current=8.346729538002725
color yellow, pair_03
distance pair_04, 1CRN and resi 6 and name CA, 1CRN and resi 17 and name CA  # target=11.07320225813793 current=18.168579637254126
color yellow, pair_04
distance pair_05, 1CRN and resi 21 and name CA, 1CRN and resi 43 and name CA  # target=23.217683038913844 current=16.48562148912102
color yellow, pair_05
distance pair_06, 1CRN and resi 11 and name CA, 1CRN and resi 44 and name CA  # target=20.375226138389795 current=13.807658081706808
color yellow, pair_06
distance pair_07, 1CRN and resi 1 and name CA, 1CRN and resi 42 and name CA  # target=16.473973824693374 current=9.930518494519935
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
