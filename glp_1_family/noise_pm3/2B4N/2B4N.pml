# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.4681217415264545

load 2B4N.pdb, 2B4N
bg_color white
hide everything, 2B4N
show cartoon, 2B4N
color grey80, 2B4N
set cartoon_transparency, 0.1

select worst_residues, 2B4N and resi 5+6+15+21+22+24+27+28+30+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2B4N and resi 40+4036
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2B4N and resi 22 and name CA, 2B4N and resi 34 and name CA  # target=13.433537380825975 current=23.26097314463952
color yellow, pair_00
distance pair_01, 2B4N and resi 11 and name CA, 2B4N and resi 28 and name CA  # target=33.94766788378666 current=24.360876572778984
color yellow, pair_01
distance pair_02, 2B4N and resi 14 and name CA, 2B4N and resi 33 and name CA  # target=22.727051628078083 current=31.69197909596726
color yellow, pair_02
distance pair_03, 2B4N and resi 21 and name CA, 2B4N and resi 39 and name CA  # target=41.00613245643101 current=32.39700429437147
color yellow, pair_03
distance pair_04, 2B4N and resi 14 and name CA, 2B4N and resi 39 and name CA  # target=51.83720830017027 current=43.2918758221447
color yellow, pair_04
distance pair_05, 2B4N and resi 1 and name CA, 2B4N and resi 14 and name CA  # target=23.050163107865004 current=14.571539092918137
color yellow, pair_05
distance pair_06, 2B4N and resi 7 and name CA, 2B4N and resi 25 and name CA  # target=20.823642394468646 current=29.164131967656985
color yellow, pair_06
distance pair_07, 2B4N and resi 15 and name CA, 2B4N and resi 26 and name CA  # target=7.980467298343213 current=16.196780320287743
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
