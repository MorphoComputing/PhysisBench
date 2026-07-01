# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set/general_benchmark/1HPH/sequence/1HPH.pdb`
- output_pdb: `general_benchmark/evidence_ladder/80pct_masked/1HPH/seeds/seed_1/1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 3.260 A
- tm_score_ca_ordered: 0.37419401584016143
- heavy_atom_rmsd: 4.978 A
- sidechain_heavy_atom_rmsd: 5.958 A
- **all-atom quality (honest):** heavy 4.978 A, sidechain 5.958 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 3
- distogram_pairs: 106
- bin_accuracy: 0.745

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain_block reason=rejected_lj_regression tested=30
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.259924823325142
- ga_delta_rmsd: 5.448789179870406  ga_fitness_mode: energy
- pre_local_rmsd: 3.2599080233343236  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** L6-H13 → 3 conflicts (100%)
- explained: 3/3 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.086), conflicts/hub=1.0, max_incompat=3.89Å, chain_span=0.686
- **fix-first:** [LOW_CONFLICT] Root cause(s): L6-H13 — explain ~3/3 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L6** — severity 2.21, 1 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): M17@19.6Å(now 16.2,conf 0.57), S2@10.2Å(now 6.1,conf 0.55)
  - M17↔N9: targets 19.6/5.1Å but partners are 10.6Å apart → too_close_together by 3.9Å
- **V30** — severity 1.59, 1 conflict(s); suspect input ~`G11` (group: push_out)
  - push-out (wants farther): H13@20.4Å(now 16.9,conf 0.59), F33@6.1Å(now 2.7,conf 0.55)
  - H13↔G11: targets 20.4/16.0Å but partners are 1.5Å apart → too_close_together by 2.9Å
- **E21** — severity 1.02, 1 conflict(s); suspect input ~`H13` (group: push_out)
  - push-out (wants farther): M7@20.1Å(now 17.6,conf 0.58)
  - M7↔H13: targets 20.1/12.7Å but partners are 5.6Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=22 · strand(E)=7 · 3-10(G)=4 · coil(C)=2

```
EEHEHEHGGGCHGCHEHHHHHHHHHHHEHHHHHHE
```

## Backbone H-bond Network

- total=13 · helix(i→i+4)=11 · sheet=2
  - E3 ↔ M7  (helix)
  - N15 ↔ R19  (helix)
  - M17 ↔ E21  (helix)
  - E18 ↔ W22  (helix)
  - V20 ↔ R24  (helix)
  - E21 ↔ K25  (helix)
  - W22 ↔ K26  (helix)
  - K25 ↔ D29  (helix)
  - K26 ↔ V30  (helix)
  - L27 ↔ H31  (helix)
  - V30 ↔ V34  (helix)
  - V1 ↔ L6  (sheet)
  - Q28 ↔ A35  (sheet)

## Solvent Accessibility (burial)

- buried=16 · exposed=7 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=12 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8712 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=3 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
