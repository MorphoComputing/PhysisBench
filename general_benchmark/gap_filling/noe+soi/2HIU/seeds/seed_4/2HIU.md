# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\2HIU\seeds\seed_4\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 6.273 A
- tm_score_ca_ordered: 0.17389349621024291
- heavy_atom_rmsd: 7.400 A
- sidechain_heavy_atom_rmsd: 8.384 A
- **all-atom quality (honest):** heavy 7.400 A, sidechain 8.384 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 14
- distogram_pairs: 223
- bin_accuracy: 0.386

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** C25 → 52 conflicts (44%); Q22 → 16 conflicts (14%); H28 → 11 conflicts (9%)
- explained: 79/117 conflicts by 3 root cause(s)
- metrics: hubs=21 (frac 0.447), conflicts/hub=5.6, max_incompat=8.09Å, chain_span=0.83
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): C25 + Q22 + H28 — explain ~79/117 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C25** — severity 25.59, 13 conflict(s); suspect input ~`N21` (group: pull_in)
  - pull-in (wants closer): V20@6.3Å(now 10.7,conf 0.67), H28@4.9Å(now 9.8,conf 0.67), A32@11.9Å(now 16.7,conf 0.59), L29@5.0Å(now 10.9,conf 0.58), V30@7.2Å(now 13.3,conf 0.52), C19@9.3Å(now 15.2,conf 0.49), E31@10.0Å(now 17.4,conf 0.44), Y44@4.3Å(now 12.4,conf 0.41), P46@4.5Å(now 12.5,conf 0.39), N21@4.5Å(now 7.9,conf 0.39), T45@4.5Å(now 12.8,conf 0.39)
  - N21↔T45: targets 4.5/4.5Å but partners are 17.1Å apart → too_far_apart by 8.1Å
  - P46↔N21: targets 4.5/4.5Å but partners are 16.9Å apart → too_far_apart by 7.9Å
  - Y44↔N21: targets 4.3/4.5Å but partners are 15.6Å apart → too_far_apart by 6.7Å
- **L29** — severity 21.21, 10 conflict(s); suspect input ~`C25` (group: pull_in)
  - pull-in (wants closer): L35@7.2Å(now 10.0,conf 0.82), Y34@5.8Å(now 8.3,conf 0.69), C25@5.0Å(now 10.9,conf 0.58)
  - Y34↔C25: targets 5.8/5.0Å but partners are 18.0Å apart → too_far_apart by 7.2Å
  - L35↔C25: targets 7.2/5.0Å but partners are 18.6Å apart → too_far_apart by 6.5Å
  - L33↔C25: targets 8.7/5.0Å but partners are 17.6Å apart → too_far_apart by 3.9Å
- **H28** — severity 17.75, 15 conflict(s); suspect input ~`F43` (group: pull_in)
  - pull-in (wants closer): C25@4.9Å(now 9.8,conf 0.67), F43@5.2Å(now 8.6,conf 0.26), F42@5.7Å(now 8.9,conf 0.23)
  - push-out (wants farther): A32@10.8Å(now 7.5,conf 0.82), L33@11.6Å(now 8.7,conf 0.59)
  - C25↔L35: targets 4.9/9.2Å but partners are 18.6Å apart → too_far_apart by 4.5Å
  - C25↔E31: targets 4.9/9.0Å but partners are 17.4Å apart → too_far_apart by 3.5Å
  - C25↔Y34: targets 4.9/10.1Å but partners are 18.0Å apart → too_far_apart by 3.0Å
- **Q22** — severity 17.34, 10 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): C19@10.9Å(now 13.7,conf 0.94)
  - push-out (wants farther): G26@8.6Å(now 5.7,conf 0.67), N17@14.8Å(now 8.4,conf 0.67), E16@17.3Å(now 9.0,conf 0.66), L15@16.2Å(now 7.9,conf 0.34)
  - G26↔E16: targets 8.6/17.3Å but partners are 3.8Å apart → too_close_together by 5.0Å
  - C25↔L15: targets 4.5/16.2Å but partners are 5.2Å apart → too_close_together by 6.5Å
  - H28↔E16: targets 10.2/17.3Å but partners are 3.8Å apart → too_close_together by 3.3Å
- **V30** — severity 15.72, 7 conflict(s); suspect input ~`Y34` (group: push_out)
  - pull-in (wants closer): L35@5.0Å(now 8.1,conf 0.67), C25@7.2Å(now 13.3,conf 0.52), H23@6.6Å(now 9.4,conf 0.43)
  - push-out (wants farther): C37@6.8Å(now 4.0,conf 0.52)
  - L35↔C25: targets 5.0/7.2Å but partners are 18.6Å apart → too_far_apart by 6.4Å
  - C25↔L33: targets 7.2/3.9Å but partners are 17.6Å apart → too_far_apart by 6.5Å
  - C25↔Y34: targets 7.2/4.5Å but partners are 18.0Å apart → too_far_apart by 6.2Å
- **H23** — severity 13.36, 8 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): V30@6.6Å(now 9.4,conf 0.43)
  - push-out (wants farther): N17@13.7Å(now 6.0,conf 0.52), E16@16.0Å(now 7.0,conf 0.34)
  - G26↔E16: targets 4.8/16.0Å but partners are 3.8Å apart → too_close_together by 7.4Å
  - N17↔V20: targets 13.7/4.5Å but partners are 3.9Å apart → too_close_together by 5.3Å
  - N17↔G26: targets 13.7/4.8Å but partners are 4.0Å apart → too_close_together by 4.9Å

## Secondary Structure (DSSP-like)

- helix(H)=30 · strand(E)=12 · 3-10(G)=3 · coil(C)=2

```
CEEGHHEHHECHGHEHHHHEEHHHHGHHHHHHHEHHHEHEHHEHHHE
```

## Backbone H-bond Network

- total=34 · helix(i→i+4)=16 · sheet=18
  - C5 ↔ I9  (helix)
  - L12 ↔ E16  (helix)
  - Q14 ↔ Y18  (helix)
  - Y18 ↔ Q22  (helix)
  - C19 ↔ H23  (helix)
  - H23 ↔ S27  (helix)
  - C25 ↔ L29  (helix)
  - S27 ↔ E31  (helix)
  - L29 ↔ L33  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L33 ↔ C37  (helix)
  - L35 ↔ E39  (helix)
  - C37 ↔ G41  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - V2 ↔ C10  (sheet)
  - V2 ↔ L15  (sheet)
  - V2 ↔ V20  (sheet)
  - V2 ↔ N21  (sheet)
  - … +14 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=247 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=156 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=4.9284 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=14 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
