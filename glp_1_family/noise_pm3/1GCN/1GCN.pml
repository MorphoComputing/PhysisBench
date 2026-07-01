# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2216774926596203

load 1GCN.pdb, 1GCN
bg_color white
hide everything, 1GCN
show cartoon, 1GCN
color grey80, 1GCN
set cartoon_transparency, 0.1

select worst_residues, 1GCN and resi 1+2+3+4+6+11+15+16+20+23
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GCN and resi 8+19+135+753
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GCN and resi 5 and name CA, 1GCN and resi 17 and name CA  # target=14.35368869370595 current=22.559925034145014
color yellow, pair_00
distance pair_01, 1GCN and resi 6 and name CA, 1GCN and resi 16 and name CA  # target=12.5494238857677 current=18.58017481210026
color yellow, pair_01
distance pair_02, 1GCN and resi 2 and name CA, 1GCN and resi 17 and name CA  # target=34.13928716657334 current=28.250484140324204
color yellow, pair_02
distance pair_03, 1GCN and resi 6 and name CA, 1GCN and resi 20 and name CA  # target=18.14198802317922 current=23.942894507531353
color yellow, pair_03
distance pair_04, 1GCN and resi 16 and name CA, 1GCN and resi 25 and name CA  # target=19.82558222401247 current=14.158266460268191
color yellow, pair_04
distance pair_05, 1GCN and resi 6 and name CA, 1GCN and resi 14 and name CA  # target=8.435704193736193 current=14.081036100400777
color yellow, pair_05
distance pair_06, 1GCN and resi 1 and name CA, 1GCN and resi 25 and name CA  # target=47.47199586970516 current=41.85473091085869
color yellow, pair_06
distance pair_07, 1GCN and resi 10 and name CA, 1GCN and resi 25 and name CA  # target=17.755370383457517 current=23.19400006296393
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
