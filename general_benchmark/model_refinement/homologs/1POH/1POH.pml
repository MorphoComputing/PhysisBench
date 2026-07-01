# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.27045389089594163

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 4+11+12+14+29+38+40+57+58+59
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1POH and resi 10 and name CA, 1POH and resi 67 and name CA  # target=27.479764769370448 current=33.53491621089571
color yellow, pair_00
distance pair_01, 1POH and resi 11 and name CA, 1POH and resi 67 and name CA  # target=27.45762147250485 current=32.50028758886086
color yellow, pair_01
distance pair_02, 1POH and resi 10 and name CA, 1POH and resi 66 and name CA  # target=27.44637601763656 current=32.06356653842122
color yellow, pair_02
distance pair_03, 1POH and resi 56 and name CA, 1POH and resi 67 and name CA  # target=27.392898986473917 current=30.97461653694044
color yellow, pair_03
distance pair_04, 1POH and resi 11 and name CA, 1POH and resi 66 and name CA  # target=27.377005388312302 current=30.88495486321518
color yellow, pair_04
distance pair_05, 1POH and resi 57 and name CA, 1POH and resi 67 and name CA  # target=27.35958058125556 current=30.543470812350986
color yellow, pair_05
distance pair_06, 1POH and resi 10 and name CA, 1POH and resi 68 and name CA  # target=27.352010720672805 current=30.44550122200921
color yellow, pair_06
distance pair_07, 1POH and resi 9 and name CA, 1POH and resi 67 and name CA  # target=27.322648276367374 current=30.15169443820141
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
