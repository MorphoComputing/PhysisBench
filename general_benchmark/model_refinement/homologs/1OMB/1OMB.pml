# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.589169977748454

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 1+2+3+6+7+18+19+20+21+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1OMB and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1OMB and resi 21 and name CA, 1OMB and resi 29 and name CA  # target=10.069760471675634 current=5.040039757937529
color yellow, pair_00
distance pair_01, 1OMB and resi 10 and name CA, 1OMB and resi 29 and name CA  # target=10.873712249498347 current=7.491911968848498
color yellow, pair_01
distance pair_02, 1OMB and resi 21 and name CA, 1OMB and resi 30 and name CA  # target=6.66447487031191 current=3.2930463147364697
color yellow, pair_02
distance pair_03, 1OMB and resi 19 and name CA, 1OMB and resi 29 and name CA  # target=14.75094372381281 current=11.528813394625638
color yellow, pair_03
distance pair_04, 1OMB and resi 1 and name CA, 1OMB and resi 25 and name CA  # target=19.667766832714157 current=16.553270551719226
color yellow, pair_04
distance pair_05, 1OMB and resi 18 and name CA, 1OMB and resi 29 and name CA  # target=16.126879994835793 current=13.332247535709218
color yellow, pair_05
distance pair_06, 1OMB and resi 7 and name CA, 1OMB and resi 25 and name CA  # target=12.607798493086381 current=9.869533941442693
color yellow, pair_06
distance pair_07, 1OMB and resi 15 and name CA, 1OMB and resi 29 and name CA  # target=14.108718199425601 current=11.403104168522589
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
