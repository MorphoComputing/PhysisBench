# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.7256931696328114

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 4+5+6+10+11+13+17+23+24+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1OMB and resi 3+5+32
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1OMB and resi 3 and name CA, 1OMB and resi 15 and name CA  # target=11.198824063689138 current=8.122897955221212
color yellow, pair_00
distance pair_01, 1OMB and resi 5 and name CA, 1OMB and resi 22 and name CA  # target=7.246084529126738 current=9.959270613285087
color yellow, pair_01
distance pair_02, 1OMB and resi 7 and name CA, 1OMB and resi 31 and name CA  # target=6.968076876815026 current=4.39058012826609
color yellow, pair_02
distance pair_03, 1OMB and resi 17 and name CA, 1OMB and resi 31 and name CA  # target=17.11935469753651 current=14.54554583986818
color yellow, pair_03
distance pair_04, 1OMB and resi 17 and name CA, 1OMB and resi 32 and name CA  # target=13.51098624132015 current=10.982042461443669
color yellow, pair_04
distance pair_05, 1OMB and resi 13 and name CA, 1OMB and resi 32 and name CA  # target=7.459740218309076 current=9.91627757241284
color yellow, pair_05
distance pair_06, 1OMB and resi 3 and name CA, 1OMB and resi 12 and name CA  # target=16.973559871372736 current=14.58655656629199
color yellow, pair_06
distance pair_07, 1OMB and resi 2 and name CA, 1OMB and resi 19 and name CA  # target=7.618394209610869 current=9.914205271232257
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
