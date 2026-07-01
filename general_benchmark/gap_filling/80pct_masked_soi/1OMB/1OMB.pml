# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7792845393486215

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 10+12+13+16+19+23+24+25+26+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1OMB and resi 20 and name CA, 1OMB and resi 33 and name CA  # target=5.0 current=6.740068744141839
color yellow, pair_00
distance pair_01, 1OMB and resi 12 and name CA, 1OMB and resi 23 and name CA  # target=14.379424897184034 current=15.615609000737368
color yellow, pair_01
distance pair_02, 1OMB and resi 11 and name CA, 1OMB and resi 31 and name CA  # target=13.55551364256898 current=14.54887787074021
color yellow, pair_02
distance pair_03, 1OMB and resi 13 and name CA, 1OMB and resi 24 and name CA  # target=17.91293443638308 current=18.875848101710375
color yellow, pair_03
distance pair_04, 1OMB and resi 12 and name CA, 1OMB and resi 28 and name CA  # target=13.385248613219968 current=14.27152169675216
color yellow, pair_04
distance pair_05, 1OMB and resi 11 and name CA, 1OMB and resi 22 and name CA  # target=13.283770228116158 current=14.156310268657604
color yellow, pair_05
distance pair_06, 1OMB and resi 18 and name CA, 1OMB and resi 27 and name CA  # target=19.16901381362733 current=19.89940826292402
color yellow, pair_06
distance pair_07, 1OMB and resi 13 and name CA, 1OMB and resi 29 and name CA  # target=13.360367210059627 current=14.045483631218648
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
