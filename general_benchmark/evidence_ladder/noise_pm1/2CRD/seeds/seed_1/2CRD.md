# Physis Fold — Run Report

**Verdict:** PASS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm1\2CRD\seeds\seed_1\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 0.594 A
- tm_score_ca_ordered: 0.8779744016132885
- heavy_atom_rmsd: 2.293 A
- sidechain_heavy_atom_rmsd: 2.927 A
- **all-atom quality (honest):** heavy 2.293 A, sidechain 2.927 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 496
- bin_accuracy: 0.639

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=36
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.5943721363459211
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 0.5942962416440686  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** T7-K9 → 7 conflicts (70%); N28 → 3 conflicts (30%)
- explained: 10/10 conflicts by 2 root cause(s)
- metrics: hubs=5 (frac 0.147), conflicts/hub=2.0, max_incompat=3.62Å, chain_span=0.735
- **fix-first:** [LOW_CONFLICT] Root cause(s): T7-K9 + N28 — explain ~10/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **Q16** — severity 2.06, 3 conflict(s); suspect input ~`K9` (group: pull_in)
  - pull-in (wants closer): K9@8.7Å(now 11.7,conf 0.35)
  - H19↔K9: targets 5.1/8.7Å but partners are 16.4Å apart → too_far_apart by 2.7Å
  - K9↔T7: targets 8.7/15.9Å but partners are 5.5Å apart → too_close_together by 1.7Å
  - N20↔K9: targets 7.2/8.7Å but partners are 17.4Å apart → too_far_apart by 1.6Å
- **C33** — severity 2.06, 2 conflict(s); suspect input ~`T7` (group: push_out)
  - pull-in (wants closer): S8@8.0Å(now 11.0,conf 0.35)
  - push-out (wants farther): N28@16.4Å(now 13.7,conf 0.35)
  - T7↔S8: targets 15.2/8.0Å but partners are 4.0Å apart → too_close_together by 3.2Å
  - N28↔K30: targets 16.4/8.1Å but partners are 5.5Å apart → too_close_together by 2.8Å
- **N28** — severity 1.80, 2 conflict(s); suspect input ~`R32` (group: push_out)
  - push-out (wants farther): C33@16.4Å(now 13.7,conf 0.35)
  - C33↔R32: targets 16.4/8.9Å but partners are 3.9Å apart → too_close_together by 3.6Å
  - C31↔C33: targets 8.0/16.4Å but partners are 6.9Å apart → too_close_together by 1.6Å
- **K9** — severity 1.38, 2 conflict(s); suspect input ~`Q16` (group: pull_in)
  - pull-in (wants closer): Q16@8.7Å(now 11.7,conf 0.35)
  - Q16↔H19: targets 8.7/16.9Å but partners are 6.0Å apart → too_close_together by 2.1Å
  - N20↔Q16: targets 17.1/8.7Å but partners are 6.5Å apart → too_close_together by 1.9Å
- **S8** — severity 0.54, 1 conflict(s); suspect input ~`Y34` (group: pull_in)
  - pull-in (wants closer): C33@8.0Å(now 11.0,conf 0.35)
  - Y34↔C33: targets 13.4/8.0Å but partners are 3.8Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=12 · strand(E)=15 · 3-10(G)=5 · coil(C)=2

```
EEEECHEHHHGHHHHHEGEHECEGEEGHHEGEEE
```

## Backbone H-bond Network

- total=26 · helix(i→i+4)=4 · sheet=22
  - T6 ↔ E10  (helix)
  - K9 ↔ S13  (helix)
  - E10 ↔ V14  (helix)
  - Q16 ↔ N20  (helix)
  - T1 ↔ R17  (sheet)
  - T1 ↔ H19  (sheet)
  - T7 ↔ K25  (sheet)
  - T7 ↔ C26  (sheet)
  - R17 ↔ R23  (sheet)
  - R17 ↔ C33  (sheet)
  - H19 ↔ R32  (sheet)
  - H19 ↔ C33  (sheet)
  - H19 ↔ Y34  (sheet)
  - T21 ↔ R32  (sheet)
  - T21 ↔ C33  (sheet)
  - T21 ↔ Y34  (sheet)
  - R23 ↔ R32  (sheet)
  - R23 ↔ C33  (sheet)
  - R23 ↔ Y34  (sheet)
  - K25 ↔ K30  (sheet)
  - … +6 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=11 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=124 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=61 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2233 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)
