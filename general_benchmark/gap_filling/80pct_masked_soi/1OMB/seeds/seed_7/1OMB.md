# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1OMB\sequence\1OMB.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1OMB\seeds\seed_7\1OMB.pdb`
- residues: 33
- mode: oracle
- ca_rmsd: 2.345 A
- tm_score_ca_ordered: 0.4792203599615332
- heavy_atom_rmsd: 4.060 A
- sidechain_heavy_atom_rmsd: 5.192 A
- **all-atom quality (honest):** heavy 4.060 A, sidechain 5.192 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/27 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 206
- bin_accuracy: 0.699

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.3452099918424247
- ga_delta_rmsd: -0.15598493425893745  ga_fitness_mode: energy
- pre_local_rmsd: 2.3451285858192694  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** C32-T33 → 4 conflicts (80%)
- explained: 4/5 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.091), conflicts/hub=1.7, max_incompat=3.58Å, chain_span=0.455
- **fix-first:** [LOW_CONFLICT] Root cause(s): C32-T33 — explain ~4/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **T33** — severity 2.35, 2 conflict(s); suspect input ~`R22` (group: push_out)
  - push-out (wants farther): N29@13.0Å(now 10.2,conf 1.00)
  - N29↔R22: targets 13.0/6.4Å but partners are 4.1Å apart → too_close_together by 2.5Å
  - N29↔C21: targets 13.0/5.9Å but partners are 5.3Å apart → too_close_together by 1.8Å
- **G18** — severity 1.97, 1 conflict(s); suspect input ~`N29` (group: push_out)
  - push-out (wants farther): N29@18.3Å(now 14.3,conf 0.55)
  - C21↔N29: targets 9.4/18.3Å but partners are 5.3Å apart → too_close_together by 3.6Å
- **C32** — severity 1.74, 2 conflict(s); suspect input ~`E3` (group: pull_in)
  - pull-in (wants closer): E3@8.1Å(now 11.0,conf 0.55)
  - push-out (wants farther): R19@6.8Å(now 3.7,conf 0.55)
  - I26↔E3: targets 15.2/8.1Å but partners are 25.0Å apart → too_far_apart by 1.7Å
  - G27↔E3: targets 13.2/8.1Å but partners are 22.8Å apart → too_far_apart by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=7 · strand(E)=16 · 3-10(G)=6 · coil(C)=4

```
CEEEGGEEECHEEGEGHHEEHEEGEHHCGEEHC
```

## Backbone H-bond Network

- total=49 · helix(i→i+4)=1 · sheet=48
  - R17 ↔ C21  (helix)
  - A2 ↔ K7  (sheet)
  - A2 ↔ C8  (sheet)
  - A2 ↔ T13  (sheet)
  - A2 ↔ C15  (sheet)
  - A2 ↔ R19  (sheet)
  - E3 ↔ C8  (sheet)
  - E3 ↔ C15  (sheet)
  - E3 ↔ R19  (sheet)
  - D4 ↔ C15  (sheet)
  - D4 ↔ R19  (sheet)
  - D4 ↔ R22  (sheet)
  - K7 ↔ G12  (sheet)
  - K7 ↔ T13  (sheet)
  - K7 ↔ C15  (sheet)
  - K7 ↔ R19  (sheet)
  - K7 ↔ P20  (sheet)
  - K7 ↔ R22  (sheet)
  - K7 ↔ C23  (sheet)
  - C8 ↔ T13  (sheet)
  - … +29 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=14 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=123 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=69 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.9095 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C8–C21, C15–C32, C23–C30

## Side-chain Rotamers (χ1/χ2)

- 27 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
