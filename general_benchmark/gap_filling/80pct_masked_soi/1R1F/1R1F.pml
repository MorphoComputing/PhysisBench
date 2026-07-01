# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7755389824093066

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 5+13+25+26+29+30+32+33+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 5 and name CA, 1R1F and resi 29 and name CA  # target=4.528908928666211 current=5.744281608021236
color yellow, pair_00
distance pair_01, 1R1F and resi 9 and name CA, 1R1F and resi 35 and name CA  # target=22.950990372348706 current=24.00450083973146
color yellow, pair_01
distance pair_02, 1R1F and resi 22 and name CA, 1R1F and resi 32 and name CA  # target=8.31175961915899 current=9.363995799411397
color yellow, pair_02
distance pair_03, 1R1F and resi 17 and name CA, 1R1F and resi 34 and name CA  # target=13.262986973908719 current=14.192437205584543
color yellow, pair_03
distance pair_04, 1R1F and resi 1 and name CA, 1R1F and resi 22 and name CA  # target=8.307930377590804 current=9.103544204882134
color yellow, pair_04
distance pair_05, 1R1F and resi 11 and name CA, 1R1F and resi 25 and name CA  # target=11.519760079252325 current=12.23969042459703
color yellow, pair_05
distance pair_06, 1R1F and resi 10 and name CA, 1R1F and resi 35 and name CA  # target=19.606647932956896 current=20.315350796509815
color yellow, pair_06
distance pair_07, 1R1F and resi 4 and name CA, 1R1F and resi 31 and name CA  # target=8.30881782920398 current=8.9759365581623
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
