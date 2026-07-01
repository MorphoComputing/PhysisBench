# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08205910365840216

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 7+9+10+11+28+30+65+66+67+70
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.499998509983207 current=33.51098427303239
color yellow, pair_00
distance pair_01, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.499977098088348 current=32.01372461960974
color yellow, pair_01
distance pair_02, 1POH and resi 11 and name CA, 1POH and resi 66 and name CA  # target=27.499840779332562 current=30.97675891845071
color yellow, pair_02
distance pair_03, 1POH and resi 10 and name CA, 1POH and resi 68 and name CA  # target=27.49964360802977 current=30.48551082039172
color yellow, pair_03
distance pair_04, 1POH and resi 10 and name CA, 1POH and resi 29 and name CA  # target=27.49938163327631 current=30.21705960575693
color yellow, pair_04
distance pair_05, 1POH and resi 9 and name CA, 1POH and resi 67 and name CA  # target=27.499292736204715 current=30.113208934664154
color yellow, pair_05
distance pair_06, 1POH and resi 14 and name CA, 1POH and resi 67 and name CA  # target=27.495982281241975 current=29.231668069501154
color yellow, pair_06
distance pair_07, 1POH and resi 56 and name CA, 1POH and resi 66 and name CA  # target=27.493937943918972 current=28.986240275243976
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
