# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.7962469416434149

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 4+11+14+17+18+19+22+24+28+29
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1OMB and resi 16 and name CA, 1OMB and resi 25 and name CA  # target=21.90159751774513 current=22.60322050328392
color yellow, pair_00
distance pair_01, 1OMB and resi 8 and name CA, 1OMB and resi 23 and name CA  # target=8.620477745755965 current=9.298579276377925
color yellow, pair_01
distance pair_02, 1OMB and resi 16 and name CA, 1OMB and resi 26 and name CA  # target=23.060929433014376 current=23.7266993379159
color yellow, pair_02
distance pair_03, 1OMB and resi 21 and name CA, 1OMB and resi 32 and name CA  # target=5.293777773110903 current=4.644056365505951
color yellow, pair_03
distance pair_04, 1OMB and resi 16 and name CA, 1OMB and resi 32 and name CA  # target=8.399486984048304 current=9.018875112973218
color yellow, pair_04
distance pair_05, 1OMB and resi 8 and name CA, 1OMB and resi 21 and name CA  # target=6.2717629039327285 current=6.875544569318729
color yellow, pair_05
distance pair_06, 1OMB and resi 16 and name CA, 1OMB and resi 28 and name CA  # target=19.6984737561346 current=20.275440308824898
color yellow, pair_06
distance pair_07, 1OMB and resi 15 and name CA, 1OMB and resi 31 and name CA  # target=8.55786965354919 current=9.130771550402535
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
