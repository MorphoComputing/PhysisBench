# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\2CRD\seeds\seed_1\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.187 A
- tm_score_ca_ordered: 0.49490794432287155
- heavy_atom_rmsd: 3.656 A
- sidechain_heavy_atom_rmsd: 4.526 A
- **all-atom quality (honest):** heavy 3.656 A, sidechain 4.526 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.325

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=30
- rigid_domain_reconvergence: applied=True accepted=2 rmsd=3.6304762055806803 -> 3.430075480775541 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.1873093275514828
- ga_delta_rmsd: 1.089934573916275  ga_fitness_mode: energy
- pre_local_rmsd: 2.187310190686631  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (pervasive footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** N2-T21 → 177 conflicts (91%); M27-Y34 → 17 conflicts (9%)
- explained: 194/195 conflicts by 2 root cause(s)
- metrics: hubs=31 (frac 0.912), conflicts/hub=6.3, max_incompat=8.75Å, chain_span=0.941
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): N2-T21 + M27-Y34 — explain ~194/195 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K9** — severity 8.97, 15 conflict(s); suspect input ~`S22` (group: push_out)
  - pull-in (wants closer): R17@9.4Å(now 12.7,conf 0.17), C15@6.5Å(now 9.6,conf 0.30), Q16@5.9Å(now 11.3,conf 0.36)
  - push-out (wants farther): S13@8.8Å(now 6.2,conf 0.19), S22@16.6Å(now 11.6,conf 0.15), N28@16.9Å(now 14.3,conf 0.16)
  - S22↔Q16: targets 16.6/5.9Å but partners are 5.4Å apart → too_close_together by 5.3Å
  - Q16↔H19: targets 5.9/17.8Å but partners are 7.4Å apart → too_close_together by 4.5Å
  - C15↔H19: targets 6.5/17.8Å but partners are 6.7Å apart → too_close_together by 4.5Å
- **H19** — severity 8.06, 12 conflict(s); suspect input ~`E10` (group: pull_in)
  - pull-in (wants closer): G24@7.8Å(now 12.8,conf 0.23)
  - push-out (wants farther): C26@21.1Å(now 16.0,conf 0.27), E10@19.9Å(now 14.1,conf 0.23)
  - T1↔E10: targets 9.5/19.9Å but partners are 4.4Å apart → too_close_together by 6.1Å
  - G24↔C26: targets 7.8/21.1Å but partners are 8.9Å apart → too_close_together by 4.4Å
  - Q16↔E10: targets 5.6/19.9Å but partners are 10.5Å apart → too_close_together by 3.8Å
- **S8** — severity 7.43, 13 conflict(s); suspect input ~`V14` (group: pull_in)
  - pull-in (wants closer): C33@6.2Å(now 11.2,conf 0.33)
  - push-out (wants farther): K25@9.2Å(now 4.2,conf 0.18), C11@8.0Å(now 5.0,conf 0.22), G24@9.8Å(now 6.4,conf 0.16), V14@18.1Å(now 11.9,conf 0.18), N2@19.8Å(now 13.8,conf 0.22), S4@16.9Å(now 11.2,conf 0.16)
  - T1↔N2: targets 10.2/19.8Å but partners are 4.3Å apart → too_close_together by 5.3Å
  - S13↔V14: targets 9.6/18.1Å but partners are 3.8Å apart → too_close_together by 4.7Å
  - W12↔V14: targets 9.0/18.1Å but partners are 5.2Å apart → too_close_together by 3.9Å
- **L18** — severity 7.32, 11 conflict(s); suspect input ~`S4` (group: push_out)
  - pull-in (wants closer): S4@8.8Å(now 12.8,conf 0.19), S13@6.2Å(now 10.2,conf 0.33), G24@9.0Å(now 13.7,conf 0.18)
  - push-out (wants farther): K29@19.7Å(now 16.2,conf 0.22), C5@20.5Å(now 16.9,conf 0.24)
  - S4↔C5: targets 8.8/20.5Å but partners are 5.3Å apart → too_close_together by 6.4Å
  - T1↔C5: targets 7.5/20.5Å but partners are 8.4Å apart → too_close_together by 4.6Å
  - V3↔C5: targets 9.8/20.5Å but partners are 5.7Å apart → too_close_together by 5.0Å
- **N28** — severity 7.27, 9 conflict(s); suspect input ~`R32` (group: push_out)
  - push-out (wants farther): T21@23.2Å(now 20.6,conf 0.37), V14@19.7Å(now 17.1,conf 0.22), K9@16.9Å(now 14.3,conf 0.16), G24@18.8Å(now 15.5,conf 0.20), C33@20.7Å(now 12.8,conf 0.25), Y34@19.1Å(now 15.1,conf 0.20)
  - C33↔R32: targets 20.7/7.9Å but partners are 4.0Å apart → too_close_together by 8.8Å
  - C31↔C33: targets 8.9/20.7Å but partners are 6.8Å apart → too_close_together by 5.0Å
  - T21↔R32: targets 23.2/7.9Å but partners are 11.2Å apart → too_close_together by 4.1Å
- **C5** — severity 6.31, 10 conflict(s); suspect input ~`V14` (group: push_out)
  - pull-in (wants closer): V14@9.7Å(now 12.9,conf 0.17), Y34@9.5Å(now 15.0,conf 0.17), S13@8.0Å(now 12.3,conf 0.22)
  - push-out (wants farther): L18@20.5Å(now 16.9,conf 0.24)
  - Q16↔S13: targets 18.7/8.0Å but partners are 5.7Å apart → too_close_together by 5.0Å
  - N20↔Y34: targets 21.8/9.5Å but partners are 7.7Å apart → too_close_together by 4.6Å
  - V14↔L18: targets 9.7/20.5Å but partners are 6.7Å apart → too_close_together by 4.1Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=14 · 3-10(G)=4 · coil(C)=1

```
EEHHEHEHEHHHHHHHEHEGEEEGECHHHEGEGE
```

## Backbone H-bond Network

- total=33 · helix(i→i+4)=6 · sheet=27
  - S4 ↔ S8  (helix)
  - T6 ↔ E10  (helix)
  - S8 ↔ W12  (helix)
  - E10 ↔ V14  (helix)
  - W12 ↔ Q16  (helix)
  - V14 ↔ L18  (helix)
  - T1 ↔ T7  (sheet)
  - T1 ↔ K9  (sheet)
  - T1 ↔ R17  (sheet)
  - T1 ↔ H19  (sheet)
  - N2 ↔ K9  (sheet)
  - N2 ↔ R17  (sheet)
  - C5 ↔ K25  (sheet)
  - T7 ↔ K25  (sheet)
  - K9 ↔ S22  (sheet)
  - K9 ↔ R23  (sheet)
  - K9 ↔ K25  (sheet)
  - R17 ↔ S22  (sheet)
  - R17 ↔ R23  (sheet)
  - R17 ↔ R32  (sheet)
  - … +13 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=12 · exposed=13 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=138 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=78 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.8006 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
