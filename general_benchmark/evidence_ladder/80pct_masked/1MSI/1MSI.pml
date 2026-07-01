# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.579310499353524

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 16+17+18+19+20+21+38+42+54+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1MSI and resi 7+15+45+49+53
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1MSI and resi 19 and name CA, 1MSI and resi 31 and name CA  # target=16.85663745935067 current=6.320686182231921
color yellow, pair_00
distance pair_01, 1MSI and resi 41 and name CA, 1MSI and resi 59 and name CA  # target=13.608295400598912 current=3.4374427417415587
color yellow, pair_01
distance pair_02, 1MSI and resi 39 and name CA, 1MSI and resi 56 and name CA  # target=13.716231433304149 current=4.436466822613989
color yellow, pair_02
distance pair_03, 1MSI and resi 41 and name CA, 1MSI and resi 57 and name CA  # target=13.796013874839428 current=4.529676814863872
color yellow, pair_03
distance pair_04, 1MSI and resi 41 and name CA, 1MSI and resi 53 and name CA  # target=16.95698332146864 current=8.23652983918201
color yellow, pair_04
distance pair_05, 1MSI and resi 30 and name CA, 1MSI and resi 39 and name CA  # target=17.369809587990964 current=9.044139000095269
color yellow, pair_05
distance pair_06, 1MSI and resi 18 and name CA, 1MSI and resi 52 and name CA  # target=15.544889811138212 current=7.359797045584419
color yellow, pair_06
distance pair_07, 1MSI and resi 18 and name CA, 1MSI and resi 49 and name CA  # target=13.49174785112099 current=5.343591428097978
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
