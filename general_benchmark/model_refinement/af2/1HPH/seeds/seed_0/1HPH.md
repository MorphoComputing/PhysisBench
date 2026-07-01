# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\model_refinement\af2\1HPH\seeds\seed_0\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 5.574 A
- tm_score_ca_ordered: 0.15222600428852165
- heavy_atom_rmsd: 6.962 A
- sidechain_heavy_atom_rmsd: 7.811 A
- **all-atom quality (honest):** heavy 6.962 A, sidechain 7.811 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 521
- bin_accuracy: 0.678

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=global reason=rejected_window_topology_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 5.574411050799683
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 5.574402317187471  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L27-Q28 → 10 conflicts (83%)
- explained: 10/12 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.114), conflicts/hub=3.0, max_incompat=2.67Å, chain_span=0.229
- **fix-first:** [LOW_CONFLICT] Root cause(s): L27-Q28 — explain ~10/12 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **R24** — severity 2.69, 4 conflict(s); suspect input ~`S16` (group: pull_in)
  - pull-in (wants closer): H13@16.4Å(now 19.5,conf 0.35), S16@12.3Å(now 14.9,conf 0.34)
  - Q28↔S16: targets 6.4/12.3Å but partners are 21.0Å apart → too_far_apart by 2.3Å
  - Q28↔H13: targets 6.4/16.4Å but partners are 24.8Å apart → too_far_apart by 2.0Å
  - L27↔H13: targets 5.6/16.4Å but partners are 23.8Å apart → too_far_apart by 1.8Å
- **L23** — severity 2.21, 3 conflict(s); suspect input ~`S16` (group: pull_in)
  - pull-in (wants closer): H13@15.4Å(now 18.1,conf 0.34), S16@10.6Å(now 13.4,conf 0.34)
  - L27↔S16: targets 6.4/10.6Å but partners are 19.7Å apart → too_far_apart by 2.7Å
  - L27↔H13: targets 6.4/15.4Å but partners are 23.8Å apart → too_far_apart by 2.1Å
  - Q28↔S16: targets 8.6/10.6Å but partners are 21.0Å apart → too_far_apart by 1.8Å
- **S16** — severity 1.79, 3 conflict(s); suspect input ~`L23` (group: pull_in)
  - pull-in (wants closer): Q28@18.2Å(now 21.0,conf 0.37), L27@16.5Å(now 19.7,conf 0.35), L23@10.6Å(now 13.4,conf 0.34), R24@12.3Å(now 14.9,conf 0.34)
  - H13↔L23: targets 5.6/10.6Å but partners are 18.1Å apart → too_far_apart by 1.9Å
  - H13↔L27: targets 5.6/16.5Å but partners are 23.8Å apart → too_far_apart by 1.7Å
  - H13↔R24: targets 5.6/12.3Å but partners are 19.5Å apart → too_far_apart by 1.6Å
- **M17** — severity 1.45, 2 conflict(s); suspect input ~`L27` (group: pull_in)
  - pull-in (wants closer): Q28@16.3Å(now 19.1,conf 0.35), L27@15.2Å(now 17.8,conf 0.34)
  - H13↔L27: targets 6.5/15.2Å but partners are 23.8Å apart → too_far_apart by 2.2Å
  - H13↔Q28: targets 6.5/16.3Å but partners are 24.8Å apart → too_far_apart by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=12 · 3-10(G)=5 · coil(C)=5

```
CEEHGHHHHHECGCHEHEHHEECEHGEGEHHEEGC
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=3 · sheet=10
  - I4 ↔ H8  (helix)
  - L6 ↔ L10  (helix)
  - N15 ↔ R19  (helix)
  - G11 ↔ S16  (sheet)
  - G11 ↔ E18  (sheet)
  - S16 ↔ E21  (sheet)
  - S16 ↔ W22  (sheet)
  - E18 ↔ R24  (sheet)
  - E21 ↔ L27  (sheet)
  - W22 ↔ L27  (sheet)
  - R24 ↔ D29  (sheet)
  - L27 ↔ N32  (sheet)
  - L27 ↔ F33  (sheet)

## Solvent Accessibility (burial)

- buried=18 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=1 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7669 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
