# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1HPH\sequence\1HPH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1HPH\seeds\seed_5\1HPH.pdb`
- residues: 35
- mode: oracle
- ca_rmsd: 3.582 A
- tm_score_ca_ordered: 0.3949499859577907
- heavy_atom_rmsd: 4.725 A
- sidechain_heavy_atom_rmsd: 5.468 A
- **all-atom quality (honest):** heavy 4.725 A, sidechain 5.468 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 235
- bin_accuracy: 0.685

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=insufficient_rmsd_improvement tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 3.5816489490442547
- ga_delta_rmsd: 2.3069790002960957  ga_fitness_mode: energy
- pre_local_rmsd: 3.581638225356522  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.057), conflicts/hub=1.0, max_incompat=1.94Å, chain_span=0.2
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **H13** — severity 1.11, 1 conflict(s); suspect input ~`L6` (group: push_out)
  - push-out (wants farther): L6@13.6Å(now 10.1,conf 0.59)
  - H8↔L6: targets 10.1/13.6Å but partners are 1.6Å apart → too_close_together by 1.9Å
- **L6** — severity 1.11, 1 conflict(s); suspect input ~`N9` (group: push_out)
  - push-out (wants farther): H13@13.6Å(now 10.1,conf 0.59), K12@12.0Å(now 9.1,conf 0.44)
  - H13↔N9: targets 13.6/5.1Å but partners are 6.6Å apart → too_close_together by 1.9Å

## Secondary Structure (DSSP-like)

- helix(H)=24 · strand(E)=7 · 3-10(G)=0 · coil(C)=4

```
CHHHHHHHEHEEHHEEHCHHHHHHHHHEEHHCHHC
```

## Backbone H-bond Network

- total=14 · helix(i→i+4)=11 · sheet=3
  - S2 ↔ L6  (helix)
  - E3 ↔ M7  (helix)
  - I4 ↔ H8  (helix)
  - L6 ↔ L10  (helix)
  - L10 ↔ L14  (helix)
  - H13 ↔ M17  (helix)
  - R19 ↔ L23  (helix)
  - V20 ↔ R24  (helix)
  - W22 ↔ K26  (helix)
  - L23 ↔ L27  (helix)
  - L27 ↔ H31  (helix)
  - N9 ↔ N15  (sheet)
  - N9 ↔ S16  (sheet)
  - G11 ↔ S16  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=11 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=90 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2995 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
