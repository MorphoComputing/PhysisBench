# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.613727571110624

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 2+7+10+13+16+17+20+22+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 1 and name CA, 1PT4 and resi 10 and name CA  # target=12.711106613550657 current=9.538198531772442
color yellow, pair_00
distance pair_01, 1PT4 and resi 2 and name CA, 1PT4 and resi 23 and name CA  # target=11.627579660692119 current=9.066754785086564
color yellow, pair_01
distance pair_02, 1PT4 and resi 13 and name CA, 1PT4 and resi 26 and name CA  # target=9.104789986730127 current=11.56303777270663
color yellow, pair_02
distance pair_03, 1PT4 and resi 1 and name CA, 1PT4 and resi 13 and name CA  # target=14.49486595748994 current=12.15556878363138
color yellow, pair_03
distance pair_04, 1PT4 and resi 11 and name CA, 1PT4 and resi 24 and name CA  # target=14.302555036474306 current=12.05266809331255
color yellow, pair_04
distance pair_05, 1PT4 and resi 3 and name CA, 1PT4 and resi 24 and name CA  # target=15.778212107140407 current=13.542077469826339
color yellow, pair_05
distance pair_06, 1PT4 and resi 3 and name CA, 1PT4 and resi 27 and name CA  # target=10.92330865721841 current=8.793672863760776
color yellow, pair_06
distance pair_07, 1PT4 and resi 1 and name CA, 1PT4 and resi 26 and name CA  # target=11.902386739151536 current=9.794252111556318
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
