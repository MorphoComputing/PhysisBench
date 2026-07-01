# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4594908724807974

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+3+42+43+54+55+71+85+86
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 3
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 71 and name CA, 2ACY and resi 86 and name CA  # target=27.496333279039835 current=35.96389833417038
color yellow, pair_00
distance pair_01, 2ACY and resi 3 and name CA, 2ACY and resi 18 and name CA  # target=27.495469331932153 current=35.699910576671115
color yellow, pair_01
distance pair_02, 2ACY and resi 3 and name CA, 2ACY and resi 42 and name CA  # target=27.495025442347266 current=35.49119047983654
color yellow, pair_02
distance pair_03, 2ACY and resi 18 and name CA, 2ACY and resi 86 and name CA  # target=27.49446690003457 current=35.34620496000661
color yellow, pair_03
distance pair_04, 2ACY and resi 3 and name CA, 2ACY and resi 43 and name CA  # target=27.49403160109532 current=35.159697889913325
color yellow, pair_04
distance pair_05, 2ACY and resi 1 and name CA, 2ACY and resi 18 and name CA  # target=27.493709866286054 current=35.10257062061369
color yellow, pair_05
distance pair_06, 2ACY and resi 1 and name CA, 2ACY and resi 42 and name CA  # target=27.492845535681482 current=34.82138925073777
color yellow, pair_06
distance pair_07, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.49147121093809 current=34.67762356467661
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
