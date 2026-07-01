# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noise_pm1\1JRJ\seeds\seed_0\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.264 A
- tm_score_ca_ordered: 0.5453562222083931
- heavy_atom_rmsd: 4.751 A
- sidechain_heavy_atom_rmsd: 6.278 A
- **all-atom quality (honest):** heavy 4.751 A, sidechain 6.278 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 595
- bin_accuracy: 0.719

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G1-G3 → 75 conflicts (55%); G29 → 19 conflicts (14%); P37 → 15 conflicts (11%)
- explained: 109/136 conflicts by 3 root cause(s)
- metrics: hubs=17 (frac 0.459), conflicts/hub=8.0, max_incompat=4.61Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G1-G3 + G29 + P37 — explain ~109/136 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **E16** — severity 24.22, 22 conflict(s); suspect input ~`G29` (group: pull_in)
  - pull-in (wants closer): E2@23.6Å(now 26.1,conf 0.58), G29@14.1Å(now 16.8,conf 0.44)
  - E2↔G29: targets 23.6/14.1Å but partners are 42.2Å apart → too_far_apart by 4.5Å
  - T4↔G29: targets 18.8/14.1Å but partners are 36.3Å apart → too_far_apart by 3.5Å
  - E2↔S31: targets 23.6/20.9Å but partners are 47.3Å apart → too_far_apart by 2.8Å
- **M13** — severity 18.38, 17 conflict(s); suspect input ~`G1` (group: pull_in)
  - pull-in (wants closer): G1@22.1Å(now 25.1,conf 0.55)
  - G1↔P30: targets 22.1/22.3Å but partners are 47.2Å apart → too_far_apart by 2.8Å
  - G1↔G28: targets 22.1/22.1Å but partners are 46.9Å apart → too_far_apart by 2.7Å
  - G1↔P36: targets 22.1/15.0Å but partners are 40.4Å apart → too_far_apart by 3.3Å
- **G1** — severity 17.09, 14 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): M13@22.1Å(now 25.1,conf 0.55)
  - V18↔M13: targets 34.1/22.1Å but partners are 8.0Å apart → too_close_together by 4.0Å
  - A17↔M13: targets 31.9/22.1Å but partners are 6.7Å apart → too_close_together by 3.1Å
  - P36↔M13: targets 41.8/22.1Å but partners are 17.3Å apart → too_close_together by 2.5Å
- **R19** — severity 15.30, 12 conflict(s); suspect input ~`G3` (group: push_out)
  - pull-in (wants closer): G3@23.7Å(now 26.9,conf 0.58), P37@7.7Å(now 10.3,conf 0.46)
  - push-out (wants farther): S10@17.1Å(now 14.3,conf 0.45)
  - G3↔I22: targets 23.7/4.4Å but partners are 31.7Å apart → too_far_apart by 3.6Å
  - G3↔G28: targets 23.7/12.9Å but partners are 40.5Å apart → too_far_apart by 3.9Å
  - G1↔G3: targets 33.7/23.7Å but partners are 7.2Å apart → too_close_together by 2.8Å
- **E2** — severity 12.78, 9 conflict(s); suspect input ~`E16` (group: pull_in)
  - pull-in (wants closer): E16@23.6Å(now 26.1,conf 0.58)
  - V18↔E16: targets 31.8/23.6Å but partners are 3.7Å apart → too_close_together by 4.6Å
  - P30↔E16: targets 46.1/23.6Å but partners are 19.1Å apart → too_close_together by 3.5Å
  - N27↔E16: targets 43.3/23.6Å but partners are 17.4Å apart → too_close_together by 2.3Å
- **S7** — severity 12.37, 9 conflict(s); suspect input ~`P37` (group: push_out)
  - pull-in (wants closer): P37@20.9Å(now 23.9,conf 0.52)
  - push-out (wants farther): G3@10.6Å(now 8.0,conf 0.44)
  - P30↔P37: targets 35.3/20.9Å but partners are 10.7Å apart → too_close_together by 3.7Å
  - P37↔P35: targets 20.9/31.1Å but partners are 6.8Å apart → too_close_together by 3.4Å
  - S31↔P37: targets 37.7/20.9Å but partners are 14.0Å apart → too_close_together by 2.9Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=12 · 3-10(G)=6 · coil(C)=4

```
EEEGGGGHCCHEEHHHHHHHHHHGGEEHECHEHECEE
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=4 · sheet=10
  - K11 ↔ E15  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - R19 ↔ E23  (helix)
  - K26 ↔ S32  (sheet)
  - K26 ↔ P36  (sheet)
  - N27 ↔ S32  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P36  (sheet)
  - N27 ↔ P37  (sheet)
  - G29 ↔ A34  (sheet)
  - G29 ↔ P36  (sheet)
  - G29 ↔ P37  (sheet)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=111 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=11 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9177 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
