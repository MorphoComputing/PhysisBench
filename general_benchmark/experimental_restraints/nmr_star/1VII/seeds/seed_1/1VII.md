# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 5.589 A
- tm_score_ca_ordered: 0.11562827041015067
- heavy_atom_rmsd: 7.136 A
- sidechain_heavy_atom_rmsd: 8.337 A
- **all-atom quality (honest):** heavy 7.136 A, sidechain 8.337 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 20
- distogram_pairs: 59
- bin_accuracy: 0.492

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** K7 → 9 conflicts (50%); G11 → 5 conflicts (28%)
- explained: 14/18 conflicts by 2 root cause(s)
- metrics: hubs=7 (frac 0.206), conflicts/hub=2.6, max_incompat=5.28Å, chain_span=0.765
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): K7 + G11 — explain ~14/18 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A18** — severity 3.22, 3 conflict(s); suspect input ~`K7` (group: push_out)
  - pull-in (wants closer): K7@4.0Å(now 8.0,conf 0.22)
  - push-out (wants farther): P21@4.0Å(now 0.7,conf 0.22)
  - K7↔K29: targets 4.0/4.0Å but partners are 13.3Å apart → too_far_apart by 5.3Å
  - K7↔K30: targets 4.0/4.0Å but partners are 13.2Å apart → too_far_apart by 5.2Å
  - K7↔Q26: targets 4.0/4.0Å but partners are 12.0Å apart → too_far_apart by 3.9Å
- **G11** — severity 2.59, 4 conflict(s); suspect input ~`K7` (group: pull_in)
  - pull-in (wants closer): K30@4.3Å(now 7.0,conf 0.41), K7@4.7Å(now 8.4,conf 0.19)
  - K30↔K7: targets 4.3/4.7Å but partners are 13.2Å apart → too_far_apart by 4.3Å
  - K7↔K29: targets 4.7/4.7Å but partners are 13.3Å apart → too_far_apart by 4.0Å
  - K30↔S15: targets 4.3/4.0Å but partners are 11.1Å apart → too_far_apart by 2.7Å
- **K7** — severity 2.02, 4 conflict(s); suspect input ~`G11` (group: pull_in)
  - pull-in (wants closer): A18@4.0Å(now 8.0,conf 0.22), G11@4.7Å(now 8.4,conf 0.19)
  - A18↔E4: targets 4.0/3.5Å but partners are 10.5Å apart → too_far_apart by 2.9Å
  - S2↔A18: targets 4.0/4.0Å but partners are 10.7Å apart → too_far_apart by 2.6Å
  - E4↔G11: targets 3.5/4.7Å but partners are 10.9Å apart → too_far_apart by 2.7Å
- **S15** — severity 1.51, 4 conflict(s); suspect input ~`E4` (group: pull_in)
  - pull-in (wants closer): S2@4.7Å(now 8.6,conf 0.19), E4@4.7Å(now 7.6,conf 0.19)
  - A18↔S2: targets 3.8/4.7Å but partners are 10.7Å apart → too_far_apart by 2.2Å
  - G11↔E4: targets 4.0/4.7Å but partners are 10.9Å apart → too_far_apart by 2.2Å
  - A18↔E4: targets 3.8/4.7Å but partners are 10.5Å apart → too_far_apart by 2.0Å
- **G33** — severity 0.75, 1 conflict(s); suspect input ~`K29` (group: pull_in)
  - pull-in (wants closer): K29@3.5Å(now 7.7,conf 0.21)
  - F10↔K29: targets 4.0/3.5Å but partners are 11.1Å apart → too_far_apart by 3.5Å
- **K29** — severity 0.44, 1 conflict(s); suspect input ~`Q25` (group: pull_in)
  - pull-in (wants closer): G33@3.5Å(now 7.7,conf 0.21)
  - Q25↔G33: targets 3.5/3.5Å but partners are 9.1Å apart → too_far_apart by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=8 · 3-10(G)=1 · coil(C)=1

```
EEHHHEHHHEHHEHHHHHHHHHHHHEHEHHGEHC
```

## Backbone H-bond Network

- total=29 · helix(i→i+4)=17 · sheet=12
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - A8 ↔ M12  (helix)
  - G11 ↔ S15  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - A16 ↔ L20  (helix)
  - F17 ↔ P21  (helix)
  - A18 ↔ L22  (helix)
  - N19 ↔ W23  (helix)
  - L20 ↔ K24  (helix)
  - P21 ↔ Q25  (helix)
  - W23 ↔ N27  (helix)
  - Q25 ↔ K29  (helix)
  - K29 ↔ G33  (helix)
  - L1 ↔ F6  (sheet)
  - L1 ↔ F10  (sheet)
  - L1 ↔ T13  (sheet)
  - … +9 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=286 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=168 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.33 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=20 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
