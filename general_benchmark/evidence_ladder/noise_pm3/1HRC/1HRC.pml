# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.2219224569765013

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 1+3+4+44+75+76+86+96+99+100
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HRC and resi 19+37+102+258+518+791
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HRC and resi 36 and name CA, 1HRC and resi 100 and name CA  # target=20.88661446270234 current=8.449413749724897
color yellow, pair_00
distance pair_01, 1HRC and resi 18 and name CA, 1HRC and resi 73 and name CA  # target=12.712388933922627 current=24.34230003616012
color yellow, pair_01
distance pair_02, 1HRC and resi 37 and name CA, 1HRC and resi 96 and name CA  # target=23.120972065932715 current=11.865142107068758
color yellow, pair_02
distance pair_03, 1HRC and resi 35 and name CA, 1HRC and resi 100 and name CA  # target=14.502670253696056 current=4.29717953655084
color yellow, pair_03
distance pair_04, 1HRC and resi 56 and name CA, 1HRC and resi 98 and name CA  # target=22.051135073256738 current=12.471605322068411
color yellow, pair_04
distance pair_05, 1HRC and resi 35 and name CA, 1HRC and resi 96 and name CA  # target=16.297949420252944 current=6.965183772590362
color yellow, pair_05
distance pair_06, 1HRC and resi 60 and name CA, 1HRC and resi 96 and name CA  # target=17.548473539471928 current=8.273686144291002
color yellow, pair_06
distance pair_07, 1HRC and resi 17 and name CA, 1HRC and resi 74 and name CA  # target=11.02736282634563 current=20.021938934521398
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
