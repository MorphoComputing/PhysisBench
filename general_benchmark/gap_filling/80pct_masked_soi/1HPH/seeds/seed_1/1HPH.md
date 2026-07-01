# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_1\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 3.349 A
- tm_score_ca_ordered: 0.33199592665456207
- heavy_atom_rmsd: 4.867 A
- sidechain_heavy_atom_rmsd: 5.756 A
- **all-atom quality (honest):** heavy 4.867 A, sidechain 5.756 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 236
- bin_accuracy: 0.589

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_window_topology_regression tested=33
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.3488575085279004
- ga_delta_rmsd: 0.38014826407125035  ga_fitness_mode: energy
- pre_local_rmsd: 3.3488309026075624  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** M7-N9 → 4 conflicts (100%)
- explained: 4/4 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.114), conflicts/hub=1.0, max_incompat=2.51Å, chain_span=0.429
- **fix-first:** [LOW_CONFLICT] Root cause(s): M7-N9 — explain ~4/4 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L14** — severity 1.75, 1 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): M7@12.8Å(now 8.8,conf 0.82), H8@10.8Å(now 8.0,conf 0.82)
  - M7↔N9: targets 12.8/7.6Å but partners are 2.7Å apart → too_close_together by 2.5Å
- **E21** — severity 1.28, 1 conflict(s); suspect input ~`M7` (group: push_out)
  - push-out (wants farther): M7@20.1Å(now 17.0,conf 0.58)
  - L14↔M7: targets 9.1/20.1Å but partners are 8.8Å apart → too_close_together by 2.2Å
- **H13** — severity 1.20, 1 conflict(s); suspect input ~`M7` (group: push_out)
  - push-out (wants farther): H8@9.5Å(now 5.2,conf 0.82), N9@7.0Å(now 3.8,conf 0.72), L10@7.0Å(now 4.3,conf 0.67), M7@11.9Å(now 6.3,conf 0.55)
  - N9↔M7: targets 7.0/11.9Å but partners are 2.7Å apart → too_close_together by 2.2Å
- **L6** — severity 0.99, 1 conflict(s); suspect input ~`K12` (group: push_out)
  - push-out (wants farther): K12@11.7Å(now 8.3,conf 0.52)
  - N9↔K12: targets 5.1/11.7Å but partners are 4.8Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=9 · 3-10(G)=11 · coil(C)=2

```
CEGHHHEHGGHGHGGEHEGHEHHGEHGCEGGHHEE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=3 · sheet=8
  - I4 ↔ H8  (helix)
  - H13 ↔ M17  (helix)
  - W22 ↔ K26  (helix)
  - S2 ↔ M7  (sheet)
  - S16 ↔ E21  (sheet)
  - E18 ↔ K25  (sheet)
  - E21 ↔ D29  (sheet)
  - K25 ↔ V34  (sheet)
  - K25 ↔ A35  (sheet)
  - D29 ↔ V34  (sheet)
  - D29 ↔ A35  (sheet)

## Solvent Accessibility (burial)

- buried=15 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=90 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=7 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5506 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
