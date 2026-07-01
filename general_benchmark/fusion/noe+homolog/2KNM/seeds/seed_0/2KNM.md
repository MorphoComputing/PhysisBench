# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\fusion\noe+homolog\2KNM\seeds\seed_0\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 2.866 A
- tm_score_ca_ordered: 0.3540516204409213
- heavy_atom_rmsd: 4.804 A
- sidechain_heavy_atom_rmsd: 6.245 A
- **all-atom quality (honest):** heavy 4.804 A, sidechain 6.245 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 207
- bin_accuracy: 0.749

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E5-S6 → 23 conflicts (85%)
- explained: 23/27 conflicts by 1 root cause(s)
- metrics: hubs=7 (frac 0.25), conflicts/hub=3.9, max_incompat=3.43Å, chain_span=0.714
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E5-S6 — explain ~23/27 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I10** — severity 7.10, 7 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): S6@3.8Å(now 7.7,conf 0.58)
  - S6↔P2: targets 3.8/16.2Å but partners are 9.1Å apart → too_close_together by 3.4Å
  - S6↔C26: targets 3.8/11.4Å but partners are 4.3Å apart → too_close_together by 3.3Å
  - S6↔V25: targets 3.8/10.8Å but partners are 3.8Å apart → too_close_together by 3.2Å
- **S6** — severity 4.86, 5 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): I10@3.8Å(now 7.7,conf 0.58)
  - I10↔P2: targets 3.8/9.1Å but partners are 16.3Å apart → too_far_apart by 3.4Å
  - I10↔C26: targets 3.8/4.2Å but partners are 10.6Å apart → too_far_apart by 2.7Å
  - I10↔C3: targets 3.8/8.3Å but partners are 14.8Å apart → too_far_apart by 2.7Å
- **S14** — severity 3.83, 4 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): C19@3.8Å(now 7.0,conf 0.58), E5@3.8Å(now 6.7,conf 0.58)
  - I17↔E5: targets 3.8/3.8Å but partners are 10.8Å apart → too_far_apart by 3.1Å
  - E5↔S6: targets 3.8/9.6Å but partners are 3.7Å apart → too_close_together by 2.2Å
  - C19↔S20: targets 3.8/9.8Å but partners are 3.9Å apart → too_close_together by 2.1Å
- **I13** — severity 3.58, 5 conflict(s); suspect input ~`G4` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.2,conf 0.58)
  - E5↔G4: targets 3.8/11.0Å but partners are 4.0Å apart → too_close_together by 3.2Å
  - E5↔P2: targets 3.8/13.5Å but partners are 7.7Å apart → too_close_together by 2.0Å
  - E5↔V25: targets 3.8/11.9Å but partners are 6.1Å apart → too_close_together by 2.0Å
- **V25** — severity 2.13, 3 conflict(s); suspect input ~`G4` (group: pull_in)
  - pull-in (wants closer): K22@3.8Å(now 6.6,conf 0.58)
  - K22↔G4: targets 3.8/7.8Å but partners are 13.9Å apart → too_far_apart by 2.3Å
  - K22↔E5: targets 3.8/6.4Å but partners are 12.1Å apart → too_far_apart by 2.0Å
  - K22↔C3: targets 3.8/8.3Å but partners are 13.7Å apart → too_far_apart by 1.5Å
- **E5** — severity 1.68, 2 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 6.7,conf 0.58), I13@3.8Å(now 7.2,conf 0.58)
  - S14↔I17: targets 3.8/11.8Å but partners are 5.2Å apart → too_close_together by 2.8Å
  - I13↔P2: targets 3.8/7.3Å but partners are 13.2Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=7 · 3-10(G)=6 · coil(C)=1

```
CEGHEEGHHHGHHHHHHGEEGHHHEGHE
```

## Backbone H-bond Network

- total=16 · helix(i→i+4)=4 · sheet=12
  - G4 ↔ V8  (helix)
  - W9 ↔ I13  (helix)
  - I13 ↔ I17  (helix)
  - S23 ↔ Y27  (helix)
  - P2 ↔ C19  (sheet)
  - P2 ↔ S20  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ V25  (sheet)
  - C19 ↔ V25  (sheet)
  - C19 ↔ R28  (sheet)
  - S20 ↔ V25  (sheet)
  - S20 ↔ R28  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=127 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=72 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2719 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
