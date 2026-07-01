# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2341729330782423

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 2+4+9+10+11+12+13+17+24+25
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1OMB and resi 12+20+32+153
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1OMB and resi 3 and name CA, 1OMB and resi 15 and name CA  # target=16.472034363958503 current=8.155460864213314
color yellow, pair_00
distance pair_01, 1OMB and resi 17 and name CA, 1OMB and resi 32 and name CA  # target=17.203187311406737 current=9.569008094057853
color yellow, pair_01
distance pair_02, 1OMB and resi 17 and name CA, 1OMB and resi 31 and name CA  # target=20.14933874028943 current=12.934429992324354
color yellow, pair_02
distance pair_03, 1OMB and resi 3 and name CA, 1OMB and resi 12 and name CA  # target=19.03999417233848 current=12.304136389373706
color yellow, pair_03
distance pair_04, 1OMB and resi 7 and name CA, 1OMB and resi 31 and name CA  # target=11.448780587622853 current=5.009607334336534
color yellow, pair_04
distance pair_05, 1OMB and resi 23 and name CA, 1OMB and resi 32 and name CA  # target=15.427950949010649 current=9.047523595493564
color yellow, pair_05
distance pair_06, 1OMB and resi 1 and name CA, 1OMB and resi 26 and name CA  # target=14.749975647355736 current=21.10464012196282
color yellow, pair_06
distance pair_07, 1OMB and resi 5 and name CA, 1OMB and resi 22 and name CA  # target=6.425634302702467 current=12.147958098056563
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
