# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1YCC\sequence\1YCC.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1YCC\seeds\seed_3\1YCC.pdb`
- residues: 103
- mode: oracle
- ca_rmsd: 12.990 A
- tm_score_ca_ordered: 0.17891230040866357
- heavy_atom_rmsd: 13.295 A
- sidechain_heavy_atom_rmsd: 13.507 A
- **all-atom quality (honest):** heavy 13.295 A, sidechain 13.507 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/84 (0.0)
- lj_severe: 0
- lj_near: 35
- distogram_pairs: 1050
- bin_accuracy: 0.501

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_domain_topology_regression tested=54
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 12.989507601790097
- ga_delta_rmsd: -1.8790961292132113  ga_fitness_mode: energy
- pre_local_rmsd: 13.01183957769308  localized_anchor_rmsd: 12.989522966131064

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E1-L13 → 567 conflicts (74%)
- explained: 567/766 conflicts by 1 root cause(s)
- metrics: hubs=78 (frac 0.757), conflicts/hub=9.8, max_incompat=15.51Å, chain_span=0.99
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E1-L13 — explain ~567/766 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K58** — severity 151.11, 38 conflict(s); suspect input ~`V61` (group: pull_in)
  - pull-in (wants closer): P34@16.7Å(now 19.4,conf 0.55), G78@10.8Å(now 16.5,conf 0.55)
  - push-out (wants farther): K8@27.5Å(now 18.5,conf 1.00), A11@27.5Å(now 20.1,conf 1.00), A4@27.5Å(now 12.0,conf 1.00)
  - A4↔V61: targets 27.5/7.1Å but partners are 6.6Å apart → too_close_together by 13.8Å
  - A4↔L62: targets 27.5/11.0Å but partners are 4.2Å apart → too_close_together by 12.3Å
  - K8↔V61: targets 27.5/7.1Å but partners are 12.2Å apart → too_close_together by 8.2Å
- **K59** — severity 141.86, 37 conflict(s); suspect input ~`W63` (group: pull_in)
  - pull-in (wants closer): K80@13.3Å(now 18.8,conf 0.55)
  - push-out (wants farther): K8@27.5Å(now 16.7,conf 1.00), K9@27.5Å(now 13.6,conf 1.00), K15@27.2Å(now 24.2,conf 0.88), S51@15.0Å(now 11.5,conf 0.55)
  - K8↔W63: targets 27.5/11.0Å but partners are 6.5Å apart → too_close_together by 10.0Å
  - K9↔W63: targets 27.5/11.0Å but partners are 6.6Å apart → too_close_together by 9.8Å
  - K9↔L62: targets 27.5/9.4Å but partners are 9.4Å apart → too_close_together by 8.6Å
- **S6** — severity 109.06, 20 conflict(s); suspect input ~`K9` (group: push_out)
  - push-out (wants farther): T53@27.5Å(now 13.7,conf 1.00), G78@27.5Å(now 18.2,conf 1.00), E48@27.5Å(now 9.9,conf 1.00), F2@12.0Å(now 7.0,conf 0.72), L72@16.8Å(now 9.9,conf 0.55), I96@9.2Å(now 6.7,conf 0.55)
  - G10↔E48: targets 5.0/27.5Å but partners are 7.0Å apart → too_close_together by 15.5Å
  - E48↔K9: targets 27.5/5.0Å but partners are 7.0Å apart → too_close_together by 15.5Å
  - T53↔K9: targets 27.5/5.0Å but partners are 12.3Å apart → too_close_together by 10.2Å
- **E48** — severity 104.46, 21 conflict(s); suspect input ~`E1` (group: push_out)
  - push-out (wants farther): K90@27.5Å(now 23.4,conf 1.00), E1@27.5Å(now 15.3,conf 1.00), S6@27.5Å(now 9.9,conf 1.00), G41@15.0Å(now 11.2,conf 0.99), R42@11.1Å(now 8.6,conf 0.91), T79@17.5Å(now 13.7,conf 0.55), C21@16.6Å(now 10.3,conf 0.55), H22@14.6Å(now 8.3,conf 0.55), S51@8.5Å(now 5.4,conf 0.55), I39@12.3Å(now 5.6,conf 0.55), G38@12.2Å(now 7.6,conf 0.55)
  - S44↔E1: targets 11.0/27.5Å but partners are 7.9Å apart → too_close_together by 8.6Å
  - E1↔H43: targets 27.5/11.4Å but partners are 6.4Å apart → too_close_together by 9.6Å
  - S44↔S6: targets 11.0/27.5Å but partners are 9.1Å apart → too_close_together by 7.4Å
- **T12** — severity 98.16, 30 conflict(s); suspect input ~`K9` (group: pull_in)
  - pull-in (wants closer): K9@5.1Å(now 9.6,conf 0.91)
  - push-out (wants farther): A55@27.5Å(now 23.1,conf 0.99), N60@27.5Å(now 22.7,conf 0.99), I57@27.5Å(now 20.5,conf 0.99), N35@17.5Å(now 9.4,conf 0.55), N93@12.9Å(now 9.8,conf 0.55), K100@14.4Å(now 5.8,conf 0.55)
  - I57↔K9: targets 27.5/5.1Å but partners are 11.4Å apart → too_close_together by 10.9Å
  - N60↔K9: targets 27.5/5.1Å but partners are 13.2Å apart → too_close_together by 9.2Å
  - A55↔K9: targets 27.5/5.1Å but partners are 14.7Å apart → too_close_together by 7.7Å
- **A55** — severity 91.59, 33 conflict(s); suspect input ~`T79` (group: pull_in)
  - pull-in (wants closer): T79@5.8Å(now 10.6,conf 0.55)
  - push-out (wants farther): K8@27.5Å(now 18.8,conf 1.00), A7@27.5Å(now 16.7,conf 1.00), T12@27.5Å(now 23.1,conf 0.99)
  - A7↔Y52: targets 27.5/7.1Å but partners are 13.6Å apart → too_close_together by 6.8Å
  - A7↔L62: targets 27.5/13.1Å but partners are 8.6Å apart → too_close_together by 5.8Å
  - A7↔K59: targets 27.5/6.0Å but partners are 14.7Å apart → too_close_together by 6.8Å

## Secondary Structure (DSSP-like)

- helix(H)=47 · strand(E)=32 · 3-10(G)=17 · coil(C)=7

```
EEHEHEEHGEEHHCHGHHHHHEGHEHGEGEEHEHHEGGHGCCEEHGHHCGEGEHHHEHHEGCEHHGHGHHHGHEEEEHGHHEECEHHEEHHEHHEHHHHGHHC
```

## Backbone H-bond Network

- total=72 · helix(i→i+4)=14 · sheet=58
  - K8 ↔ T12  (helix)
  - K15 ↔ L19  (helix)
  - Q20 ↔ V24  (helix)
  - N35 ↔ I39  (helix)
  - D54 ↔ K58  (helix)
  - A55 ↔ K59  (helix)
  - E65 ↔ S69  (helix)
  - N67 ↔ Y71  (helix)
  - S69 ↔ T73  (helix)
  - L86 ↔ K90  (helix)
  - K87 ↔ D91  (helix)
  - K90 ↔ D94  (helix)
  - D94 ↔ Y98  (helix)
  - Y98 ↔ A102  (helix)
  - F2 ↔ A7  (sheet)
  - F2 ↔ G10  (sheet)
  - A4 ↔ G10  (sheet)
  - A4 ↔ A11  (sheet)
  - S6 ↔ A11  (sheet)
  - G10 ↔ H22  (sheet)
  - … +52 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=27 · exposed=38 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=640 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=414 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=3.7542 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=35 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 84 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
