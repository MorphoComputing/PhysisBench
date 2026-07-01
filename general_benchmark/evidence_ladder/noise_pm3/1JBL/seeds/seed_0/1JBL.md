# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1JBL\sequence\1JBL.pdb`
- output_pdb: `general_benchmark\evidence_ladder\noise_pm3\1JBL\seeds\seed_0\1JBL.pdb`
- residues: 12
- mode: oracle
- ca_rmsd: 1.366 A
- tm_score_ca_ordered: 0.17935172535380242
- heavy_atom_rmsd: 2.910 A
- sidechain_heavy_atom_rmsd: 3.499 A
- **all-atom quality (honest):** heavy 2.910 A, sidechain 3.499 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 1/1
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/12 (0.0)
- lj_severe: 0
- lj_near: 1
- distogram_pairs: 45
- bin_accuracy: 0.222

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=domain reason=accepted tested=9
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=2.0140664505707155 -> 1.3687510101171945 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.3655794978870706
- ga_delta_rmsd: 0.0  ga_fitness_mode: energy
- pre_local_rmsd: 1.3656030994789505  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** I6-F11 → 5 conflicts (100%)
- explained: 5/5 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.25), conflicts/hub=1.7, max_incompat=3.8Å, chain_span=0.417
- **fix-first:** [LOW_CONFLICT] Root cause(s): I6-F11 — explain ~5/5 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **C10** — severity 1.05, 2 conflict(s); suspect input ~`I6` (group: push_out)
  - push-out (wants farther): C2@6.6Å(now 3.6,conf 0.30), I6@16.8Å(now 11.3,conf 0.16)
  - P7↔I6: targets 7.0/16.8Å but partners are 6.0Å apart → too_close_together by 3.8Å
  - I6↔K4: targets 16.8/6.5Å but partners are 7.4Å apart → too_close_together by 2.9Å
- **I6** — severity 0.77, 2 conflict(s); suspect input ~`I9` (group: push_out)
  - push-out (wants farther): C10@16.8Å(now 11.3,conf 0.16), F11@17.0Å(now 13.8,conf 0.16)
  - C10↔I9: targets 16.8/10.3Å but partners are 3.8Å apart → too_close_together by 2.7Å
  - I9↔F11: targets 10.3/17.0Å but partners are 4.4Å apart → too_close_together by 2.3Å
- **F11** — severity 0.50, 1 conflict(s); suspect input ~`I6` (group: push_out)
  - push-out (wants farther): R1@8.5Å(now 4.8,conf 0.20), I6@17.0Å(now 13.8,conf 0.16)
  - P7↔I6: targets 7.9/17.0Å but partners are 6.0Å apart → too_close_together by 3.1Å

## Secondary Structure (DSSP-like)

- helix(H)=4 · strand(E)=3 · 3-10(G)=4 · coil(C)=1

```
ECHHEHGGGHGE
```

## Backbone H-bond Network

- total=2 · helix(i→i+4)=1 · sheet=1
  - I6 ↔ C10  (helix)
  - R1 ↔ P12  (sheet)

## Solvent Accessibility (burial)

- buried=5 · exposed=3 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=30 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=12 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.6738 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=1 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=1: C2–C10

## Side-chain Rotamers (χ1/χ2)

- 12 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
