# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.15428860798491323

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+6+7+11+14+17+18+19+20+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 2 and name CA, 1NB1 and resi 17 and name CA  # target=10.327601646091601 current=10.59064016960901
color yellow, pair_00
distance pair_01, 1NB1 and resi 7 and name CA, 1NB1 and resi 19 and name CA  # target=7.866470866779383 current=8.009514970092564
color yellow, pair_01
distance pair_02, 1NB1 and resi 3 and name CA, 1NB1 and resi 21 and name CA  # target=5.185984811523819 current=5.045165359066989
color yellow, pair_02
distance pair_03, 1NB1 and resi 7 and name CA, 1NB1 and resi 20 and name CA  # target=8.931833715028574 current=9.072587296304512
color yellow, pair_03
distance pair_04, 1NB1 and resi 8 and name CA, 1NB1 and resi 19 and name CA  # target=9.625823036384823 current=9.766208949466712
color yellow, pair_04
distance pair_05, 1NB1 and resi 3 and name CA, 1NB1 and resi 22 and name CA  # target=8.684737168814124 current=8.574649672691127
color yellow, pair_05
distance pair_06, 1NB1 and resi 14 and name CA, 1NB1 and resi 26 and name CA  # target=9.126235836271432 current=9.23557400017635
color yellow, pair_06
distance pair_07, 1NB1 and resi 4 and name CA, 1NB1 and resi 18 and name CA  # target=5.642462590198753 current=5.7514796417450675
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
