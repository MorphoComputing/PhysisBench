# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.03003972522212128

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 2+5+16+17+18+24+25+26+27+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1OMB and resi 17 and name CA, 1OMB and resi 25 and name CA  # target=23.236044655225502 current=23.624400421015945
color yellow, pair_00
distance pair_01, 1OMB and resi 2 and name CA, 1OMB and resi 26 and name CA  # target=23.04053847613054 current=23.404212180383663
color yellow, pair_01
distance pair_02, 1OMB and resi 16 and name CA, 1OMB and resi 26 and name CA  # target=23.024673863480466 current=23.378193799565647
color yellow, pair_02
distance pair_03, 1OMB and resi 17 and name CA, 1OMB and resi 26 and name CA  # target=24.63678454519942 current=24.95646360395749
color yellow, pair_03
distance pair_04, 1OMB and resi 2 and name CA, 1OMB and resi 25 and name CA  # target=22.47167456200769 current=22.662237669034415
color yellow, pair_04
distance pair_05, 1OMB and resi 17 and name CA, 1OMB and resi 28 and name CA  # target=22.215283708075525 current=22.380389703001597
color yellow, pair_05
distance pair_06, 1OMB and resi 3 and name CA, 1OMB and resi 25 and name CA  # target=21.07957132099224 current=21.241663911447947
color yellow, pair_06
distance pair_07, 1OMB and resi 21 and name CA, 1OMB and resi 32 and name CA  # target=4.428062453794771 current=4.267395493034962
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
