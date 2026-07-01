# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\5WOW\sequence\5WOW.pdb`
- output_pdb: `general_benchmark\gap_filling\noe+soi\5WOW\seeds\seed_9\5WOW.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.350 A
- tm_score_ca_ordered: 0.29421007030999413
- heavy_atom_rmsd: 6.094 A
- sidechain_heavy_atom_rmsd: 7.361 A
- **all-atom quality (honest):** heavy 6.094 A, sidechain 7.361 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/31 (0.0)
- lj_severe: 0
- lj_near: 7
- distogram_pairs: 176
- bin_accuracy: 0.494

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** G1-P4 → 26 conflicts (60%); G29 → 13 conflicts (30%)
- explained: 39/43 conflicts by 2 root cause(s)
- metrics: hubs=15 (frac 0.405), conflicts/hub=2.9, max_incompat=8.08Å, chain_span=0.973
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): G1-P4 + G29 — explain ~39/43 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Y37** — severity 11.76, 5 conflict(s); suspect input ~`Y30` (group: push_out)
  - push-out (wants farther): G1@26.5Å(now 14.0,conf 0.84), Y30@13.5Å(now 11.0,conf 0.43), D33@9.5Å(now 5.0,conf 0.43), P31@14.8Å(now 9.4,conf 0.34), Y32@10.4Å(now 7.4,conf 0.34)
  - G1↔Y30: targets 26.5/13.5Å but partners are 4.9Å apart → too_close_together by 8.1Å
  - G1↔Y32: targets 26.5/10.4Å but partners are 8.9Å apart → too_close_together by 7.2Å
  - G1↔D33: targets 26.5/9.5Å but partners are 11.8Å apart → too_close_together by 5.2Å
- **G1** — severity 9.34, 6 conflict(s); suspect input ~`P4` (group: pull_in)
  - pull-in (wants closer): A19@6.1Å(now 10.7,conf 0.15)
  - push-out (wants farther): Y37@26.5Å(now 14.0,conf 0.84), Q8@13.0Å(now 10.4,conf 0.49)
  - Y37↔P4: targets 26.5/9.5Å but partners are 11.8Å apart → too_close_together by 5.2Å
  - Y37↔L7: targets 26.5/11.7Å but partners are 10.5Å apart → too_close_together by 4.3Å
  - Y37↔I6: targets 26.5/11.0Å but partners are 11.2Å apart → too_close_together by 4.3Å
- **G29** — severity 8.08, 10 conflict(s); suspect input ~`C22` (group: pull_in)
  - pull-in (wants closer): C22@4.5Å(now 7.7,conf 0.39), I21@5.8Å(now 8.4,conf 0.22)
  - push-out (wants farther): G26@8.9Å(now 6.2,conf 0.84)
  - Y32↔C22: targets 8.5/4.5Å but partners are 16.7Å apart → too_far_apart by 3.7Å
  - V34↔C22: targets 13.0/4.5Å but partners are 20.8Å apart → too_far_apart by 3.2Å
  - D33↔C22: targets 11.0/4.5Å but partners are 18.4Å apart → too_far_apart by 2.9Å
- **A19** — severity 2.28, 4 conflict(s); suspect input ~`V2` (group: pull_in)
  - pull-in (wants closer): G1@6.1Å(now 10.7,conf 0.15), V2@6.1Å(now 16.3,conf 0.15)
  - R12↔V2: targets 7.1/6.1Å but partners are 18.6Å apart → too_far_apart by 5.3Å
  - D13↔V2: targets 9.6/6.1Å but partners are 19.8Å apart → too_far_apart by 4.1Å
  - S14↔V2: targets 12.2/6.1Å but partners are 21.8Å apart → too_far_apart by 3.4Å
- **C10** — severity 2.02, 3 conflict(s); suspect input ~`P4` (group: pull_in)
  - pull-in (wants closer): P4@10.4Å(now 14.5,conf 0.49), Y27@4.2Å(now 8.3,conf 0.43)
  - S14↔P4: targets 8.0/10.4Å but partners are 20.8Å apart → too_far_apart by 2.4Å
  - P4↔D15: targets 10.4/5.5Å but partners are 17.8Å apart → too_far_apart by 1.8Å
  - Y27↔D15: targets 4.2/5.5Å but partners are 11.4Å apart → too_far_apart by 1.7Å
- **R11** — severity 2.00, 2 conflict(s); suspect input ~`P4` (group: pull_in)
  - pull-in (wants closer): P4@11.1Å(now 14.1,conf 0.49)
  - S14↔P4: targets 7.6/11.1Å but partners are 20.8Å apart → too_far_apart by 2.1Å
  - P4↔D15: targets 11.1/4.3Å but partners are 17.8Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=19 · 3-10(G)=2 · coil(C)=4

```
EHHHEEEEEHEGHHEEECHHGHCEHCEHCEEEEEEHE
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=1 · sheet=38
  - C10 ↔ S14  (helix)
  - G1 ↔ I6  (sheet)
  - G1 ↔ L7  (sheet)
  - G1 ↔ Q8  (sheet)
  - G1 ↔ R9  (sheet)
  - G1 ↔ R11  (sheet)
  - G1 ↔ C16  (sheet)
  - G1 ↔ P17  (sheet)
  - K5 ↔ R11  (sheet)
  - I6 ↔ R11  (sheet)
  - L7 ↔ C16  (sheet)
  - L7 ↔ Y27  (sheet)
  - Q8 ↔ D15  (sheet)
  - Q8 ↔ C16  (sheet)
  - Q8 ↔ P17  (sheet)
  - Q8 ↔ G24  (sheet)
  - Q8 ↔ Y27  (sheet)
  - R9 ↔ D15  (sheet)
  - R9 ↔ C16  (sheet)
  - R9 ↔ P17  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=141 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=72 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=2.5836 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=7 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C20, C10–C22, C16–C28

## Side-chain Rotamers (χ1/χ2)

- 31 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
