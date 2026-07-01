# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\1TIT\seeds\seed_7\1TIT.pdb`
- residues: 87
- mode: refinement
- ca_rmsd: 16.059 A
- tm_score_ca_ordered: 0.08072567604706614
- heavy_atom_rmsd: 16.650 A
- sidechain_heavy_atom_rmsd: 17.329 A
- **all-atom quality (honest):** heavy 16.650 A, sidechain 17.329 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 35
- distogram_pairs: 512
- bin_accuracy: 0.299

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** H55-L59 → 528 conflicts (36%); W33-K34 → 210 conflicts (14%); V70-F72 → 128 conflicts (9%)
- explained: 866/1459 conflicts by 3 root cause(s)
- metrics: hubs=80 (frac 0.92), conflicts/hub=18.2, max_incompat=31.5Å, chain_span=0.989
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): H55-L59 + W33-K34 + V70-F72 — explain ~866/1459 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W33** — severity 313.26, 107 conflict(s); suspect input ~`I56` (group: pull_in)
  - pull-in (wants closer): K36@7.8Å(now 10.3,conf 0.69), F72@3.8Å(now 16.2,conf 0.47), Q73@4.7Å(now 19.5,conf 0.38), H55@4.9Å(now 26.5,conf 0.35), V70@5.1Å(now 18.9,conf 0.27), I48@5.2Å(now 15.1,conf 0.26), I56@5.2Å(now 30.7,conf 0.26), L57@5.2Å(now 26.2,conf 0.26)
  - push-out (wants farther): H30@10.7Å(now 7.9,conf 0.84), E26@22.5Å(now 5.7,conf 0.67), V29@13.7Å(now 8.7,conf 0.67), D28@16.1Å(now 9.3,conf 0.49), L40@8.5Å(now 3.5,conf 0.44), P27@18.6Å(now 8.2,conf 0.43)
  - Q38↔H55: targets 7.2/4.9Å but partners are 32.5Å apart → too_far_apart by 20.4Å
  - K36↔H55: targets 7.8/4.9Å but partners are 33.0Å apart → too_far_apart by 20.3Å
  - G37↔H55: targets 9.0/4.9Å but partners are 32.5Å apart → too_far_apart by 18.6Å
- **F20** — severity 183.14, 60 conflict(s); suspect input ~`I58` (group: pull_in)
  - pull-in (wants closer): L57@4.3Å(now 23.7,conf 0.41), I58@4.5Å(now 26.4,conf 0.39), L7@4.7Å(now 8.2,conf 0.37), A81@4.7Å(now 10.8,conf 0.37), Y8@5.0Å(now 9.2,conf 0.27), L83@5.4Å(now 11.3,conf 0.24), V70@5.5Å(now 16.0,conf 0.24)
  - I58↔L7: targets 4.5/4.7Å but partners are 29.2Å apart → too_far_apart by 20.1Å
  - L57↔L7: targets 4.3/4.7Å but partners are 27.9Å apart → too_far_apart by 18.9Å
  - T17↔I58: targets 8.4/4.5Å but partners are 30.7Å apart → too_far_apart by 17.8Å
- **H55** — severity 156.80, 55 conflict(s); suspect input ~`G31` (group: pull_in)
  - pull-in (wants closer): E50@4.0Å(now 7.2,conf 0.45), I22@4.3Å(now 24.0,conf 0.41), E23@4.7Å(now 21.1,conf 0.37), L24@4.8Å(now 26.5,conf 0.36), G31@4.9Å(now 27.6,conf 0.35), W33@4.9Å(now 26.5,conf 0.35), F72@5.8Å(now 14.4,conf 0.23)
  - push-out (wants farther): H60@16.5Å(now 10.9,conf 0.84), I58@10.7Å(now 7.8,conf 0.82), L59@12.4Å(now 8.9,conf 0.67), G52@5.5Å(now 1.9,conf 0.58), N61@18.2Å(now 12.6,conf 0.49), C62@21.4Å(now 11.8,conf 0.43)
  - G52↔G31: targets 5.5/4.9Å but partners are 28.7Å apart → too_far_apart by 18.3Å
  - G52↔I22: targets 5.5/4.3Å but partners are 24.9Å apart → too_far_apart by 15.1Å
  - G52↔L24: targets 5.5/4.8Å but partners are 27.2Å apart → too_far_apart by 16.9Å
- **F72** — severity 147.23, 58 conflict(s); suspect input ~`K34` (group: pull_in)
  - pull-in (wants closer): G68@8.3Å(now 11.2,conf 0.67), W33@3.8Å(now 16.2,conf 0.47), K34@4.5Å(now 22.2,conf 0.39), L24@5.1Å(now 13.4,conf 0.27), G31@5.1Å(now 19.1,conf 0.27), I22@5.6Å(now 12.7,conf 0.23), H55@5.8Å(now 14.4,conf 0.23)
  - G68↔K34: targets 8.3/4.5Å but partners are 32.4Å apart → too_far_apart by 19.6Å
  - E69↔K34: targets 6.4/4.5Å but partners are 29.2Å apart → too_far_apart by 18.3Å
  - G68↔W33: targets 8.3/3.8Å but partners are 26.1Å apart → too_far_apart by 13.9Å
- **E21** — severity 146.13, 25 conflict(s); suspect input ~`I56` (group: pull_in)
  - pull-in (wants closer): I56@4.0Å(now 27.7,conf 0.45), L57@4.3Å(now 23.1,conf 0.41), L7@4.8Å(now 9.4,conf 0.36)
  - A18↔I56: targets 7.2/4.0Å but partners are 32.8Å apart → too_far_apart by 21.6Å
  - T17↔I56: targets 8.9/4.0Å but partners are 33.9Å apart → too_far_apart by 21.0Å
  - E16↔I56: targets 10.6/4.0Å but partners are 35.4Å apart → too_far_apart by 20.7Å
- **V70** — severity 140.04, 50 conflict(s); suspect input ~`L35` (group: push_out)
  - pull-in (wants closer): L35@4.0Å(now 26.7,conf 0.45), A81@4.1Å(now 8.9,conf 0.43), L7@4.5Å(now 18.2,conf 0.39), W33@5.1Å(now 18.9,conf 0.27), K34@5.1Å(now 25.0,conf 0.27), F20@5.5Å(now 16.0,conf 0.24)
  - push-out (wants farther): Q63@9.8Å(now 3.8,conf 0.49), L64@9.1Å(now 4.4,conf 0.40)
  - T67↔L35: targets 8.8/4.0Å but partners are 32.4Å apart → too_far_apart by 19.6Å
  - G65↔L35: targets 10.8/4.0Å but partners are 31.4Å apart → too_far_apart by 16.5Å
  - M66↔L35: targets 9.0/4.0Å but partners are 28.5Å apart → too_far_apart by 15.5Å

## Secondary Structure (DSSP-like)

- helix(H)=32 · strand(E)=44 · 3-10(G)=6 · coil(C)=5

```
CEHEEEHHGEHCHHEECEEHHHHHHHEEEEEHEHEEGGEGEEECEEGHEEEEHGHHHHEEHEEEHHEHEHHHHEEEHEEHHCEEEEE
```

## Backbone H-bond Network

- total=181 · helix(i→i+4)=11 · sheet=170
  - V3 ↔ L7  (helix)
  - L7 ↔ E11  (helix)
  - F20 ↔ L24  (helix)
  - E21 ↔ S25  (helix)
  - K53 ↔ L57  (helix)
  - L57 ↔ N61  (helix)
  - N61 ↔ G65  (helix)
  - M66 ↔ V70  (helix)
  - G68 ↔ F72  (helix)
  - Q73 ↔ A77  (helix)
  - A77 ↔ A81  (helix)
  - E2 ↔ G15  (sheet)
  - E2 ↔ E16  (sheet)
  - E2 ↔ A18  (sheet)
  - E4 ↔ G15  (sheet)
  - E4 ↔ E16  (sheet)
  - E4 ↔ A18  (sheet)
  - K5 ↔ V10  (sheet)
  - K5 ↔ G15  (sheet)
  - K5 ↔ E16  (sheet)
  - … +161 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=45 · exposed=21 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=529 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=405 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=6.1538 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=35 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
